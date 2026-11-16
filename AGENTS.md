# AGENTS.md

Instructions for AI coding agents working in `maratonusp/blog` (`https://www.ime.usp.br/~maratona/`).

## Stack, Build, and Local Preview

- **Static site**: Jekyll 3 + Octopress (`Gemfile`, `_config.yml`).
- **Base URL**: `_config.yml` sets `baseurl: '/~maratona'`. Always prefix internal site links with `{{ site.baseurl }}` (in posts), `/~maratona/...` (in history YAML `url`/`img` or markdown links), or `{% include url %}` / `$` in hub configs.
- **CI/CD**: Pushes to `master` trigger `.github/workflows/jekyll.yml` (Ruby `3.1`, `JEKYLL_ENV=production bundle exec jekyll build`, then SSH deploy of `_site/`).
- **Local preview**:
  ```bash
  bundle install
  bundle exec jekyll serve
  ```
  Visit `http://localhost:4000/~maratona/` (note the `/~maratona/` suffix).
  - Note: `Dockerfile` uses `jekyll/jekyll:4`, while `Gemfile` pins `jekyll ~> 3`. If running in Docker for local testing, prefer a `ruby:3.1` container running `bundle install && bundle exec jekyll serve --host 0.0.0.0`.
- **JS/Assets** (theme pipeline):
  - Install Node deps: `npm install`
  - Lint JS: `npx grunt jshint` (or targeted `npx jshint assets/js/<file>.js --config .jshintrc`)
  - Rebuild minified JS + optimize images/SVG: `npx grunt` (watch mode: `npx grunt dev`)
- **Verification**: There is no automated test suite; after editing posts or history pages, validate YAML frontmatter (e.g., with `yaml.safe_load`) and run `bundle exec jekyll build` when Ruby is available.

## Repository Structure & Conventions

- `_posts/`: Blog posts (`YYYY-MM-DD-slug.md` or `.markdown`) with `layout: post` (default permalink `/:categories/:title/`, often overridden with `permalink:`; category archives come from `site.categories`).
  - Use `{% youtube VIDEO_ID %}` (`_plugins/youtube.rb`) for embedded lecture videos instead of raw `<iframe>` HTML when possible.
- `pages/`: Static pages (`layout: page`), including the history cluster linked via `autohub` frontmatter (`autohub.category`, `autohub.text`, `autohub.img`, optional `autohub.img_position`) and `hubs` in `_config.yml`:
  - `pages/usp_historia.markdown` — Sub-regional and Brazilian Finals history (USP Campus Butantã).
  - `pages/usp_latam.markdown` — ICPC Latin America Championship (`Programadores de América`, 2024+).
  - `pages/usp_mundial.markdown` — ICPC World Finals history.
  - `pages/seletivas.markdown` — List of Seletiva USP editions and Gym/mirror links.
  - `pages/historia.markdown` — Alumni testimonials (`_includes/depoimentos.html`).
- `categories/index.html`, `tags/index.html`, `search/index.html`: Listing pages using `layout: post-index` (`_layouts/post-index.html`).
- `index.html`: Homepage pinned event cards (`<section id="events">`, updated manually) and hub tiles (`hubs` / `hubs_class` rendered by `_includes/hubs.html`, which resolves `$` placeholders to `baseurl`).
- Navigation comes from `site.menu` in `_config.yml` rendered in `_includes/header.html` (not `_data/navigation.yml`, which is a theme leftover).
- `images/`: Contest and event photos (kept lightweight; large multi-MB originals can link directly to external URLs like `maratona.sbc.org.br` instead of being committed).
- `assets/standings/`: Optional archived BOCA scoreboard HTML snapshots embedded via `<iframe>`.
- Legacy scripts exist in `_scripts/` (`build.sh`, `deploy.sh`, `check_new_posts.sh`), while `.github/workflows/jekyll.yml` is the active CI/CD source of truth.

## Contest Updates Workflow (Sub-regional, Final Brasileira, LATAM)

### 1. Scope of Teams
- Only include **USP Campus Butantã** teams (`MaratonUSP`). Do **not** include `USP São Carlos`, `USP Ribeirão Preto`, or `EACH-USP` in Butantã lists.
- On official scoreboards (`SP, São Paulo`), `[USP]` teams may include Poli-USP or Butantã teams that registered independently without the MaratonUSP coach. Always check with the user before assuming whether unlinked `[USP]` teams belong in the post/history.

### 2. Scoreboard Parsing Pitfalls
- **Overall vs Brazil rank**: Newer MOJ contest reports (e.g., 2026 `relatorio-icpc-latam-br-fp-2026/` and `relatorio-icpc-latam-finals-2026/`) show a combined **overall** rank in `data-place` across multiple Latin American countries/regions, and filtered views may still include `CCL` (`guest`) teams.
  - When computing **Brazil rank** or **São Paulo site rank**, count only `data-country="br"` (and `data-region="SP, São Paulo"`) **excluding `CCL` / `guest` rows**.
  - Cross-check Brazilian Finals medalists, official Brazilian rank, and PdA qualifiers against `https://maratona.sbc.org.br/resultados.html`.
- **Do not fabricate missing info**: If full member names, coaches, photos, or eligibility details are missing, search `_posts/` and `pages/usp_historia.markdown` for previously confirmed names, and ask the user for anything still missing or inconsistent.

### 3. Writing Posts
- Follow the closest recent post as template:
  - Sub-regional: `_posts/2025-09-20-subreg-2025.md`, `_posts/2026-09-05-subreg-2026.md` (`permalink: subregional-YYYY`). List SP rank, Brazil rank (and overall rank if distinct), solved problems, penalty, qualification status, and `## Integrantes`.
  - Final Brasileira: `_posts/2025-11-20-final-brasileira-2025.md`, `_posts/2026-11-16-final-brasileira-2026.md` (`permalink: brasileira-YYYY`). Include event city/dates, team breakdown (members, coach, solved problems, penalty, Brazil/LATAM ranks, medals, PdA qualification), photos, album links, and official scoreboard links.
  - LATAM (PdA): `_posts/2026-03-15-latam-2026.md` (`permalink: latam-YYYY`).
- **HTML escaping**: Escape `<` and `>` in team names (e.g., `#include&lt;milagre&gt;`) in both Markdown posts and YAML `name:` fields so Kramdown/browsers do not treat them as HTML tags.

### 4. Updating History YAML (`pages/usp_*.markdown`)
- Add the new year at the **top** of `history:` in YAML frontmatter (keep exact indentation and schema).
- In `pages/usp_historia.markdown`:
  - Year fields: `title` (`Cidade, Mês YYYY`), `url` (`/~maratona/brasileira-YYYY`), `year`, `coaches`, `text` (`Sobre a [sub-regional](/~maratona/subregional-YYYY). Essa foi a final brasileira de YYYY.`), and `teams`.
  - Team fields: `members`, `name`, `rank-sub` (Brazil rank in the sub-regional), and for finalists also `img`, `rank-final` (Brazil rank in the final), and `awards` (`champion`, `gold`, `silver`, `bronze`, `latam`, `wf`).
  - From 2023 onward, Brazilian Finals classify to `latam` (not directly to `wf`).
- In `pages/usp_latam.markdown`: add the edition (`title`, `year`, `name`, `members`, `coaches`, `img`, `img_href`, `place`, `score`, and `awards` if any).
- Validate YAML frontmatter (`yaml.safe_load`) after every edit to `pages/usp_*.markdown`.
