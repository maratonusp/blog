# Copilot instructions for `maratonusp/blog`

## Build, test, and lint commands

### Ruby/Jekyll
- Install gems: `bundle install`
- Build site: `bundle exec jekyll build`
- Serve locally: `bundle exec jekyll serve` (http://localhost:4000)

### Docker path (used by maintainers for reproducible builds)
- Build Docker image and export generated site tarball: `make site`

### JavaScript asset checks/build
- Install Node deps: `npm install`
- Lint JS used by the theme pipeline: `npx grunt jshint`
- Rebuild minified JS + optimize images/SVG: `npx grunt`
- Watch JS during edits: `npx grunt dev`

### Test status
- This repository does not define a unit/integration test suite.
- For a targeted check of one JS file, run: `npx jshint assets\js\<file>.js --config .jshintrc`

## High-level architecture

- This is a **Jekyll 3 + Octopress** static site. Content and front matter are compiled into `_site` by `bundle exec jekyll build` (`Gemfile`, `_config.yml`, `.github/workflows/jekyll.yml`).
- Deployment is CI-driven: pushes to `master` trigger GitHub Actions build and SSH deploy of the generated `_site` artifact (`.github/workflows/jekyll.yml`).
- Main content surfaces:
  - Posts in `_posts/` with `layout: post`
  - Static pages in `pages/` with `layout: page`
  - Listing pages such as `categories/index.html`, `tags/index.html`, `search/index.html` using `layout: post-index`
- Navigation comes from `site.menu` in `_config.yml` and is rendered in `_includes/header.html` (not `_data/navigation.yml`, which is a theme leftover).
- Home page behavior is split across:
  - `index.html` front matter (`hubs`, `hubs_class`, pinned event cards section)
  - `_includes/hubs.html` (renders manual hubs or auto-generated hubs)
  - `_layouts/post-index.html` (list/pagination shell for index, tags, categories, search)
- “História” pages form a linked hub cluster through `autohub` metadata in page front matter (e.g., `pages/historia.markdown`, `pages/usp_*.markdown`) plus hub class mapping in `_config.yml`.
- A custom Liquid tag plugin `{% youtube <id> %}` is implemented in `_plugins/youtube.rb`.

## Key conventions specific to this repository

- **Always respect `baseurl`** (`/~maratona`): internal links should use `{% include url %}` or the `$` placeholder pattern used in hub configs, then resolved in `_includes/hubs.html`.
- **Homepage cards are manual**: update `index.html` `<section id="events">` directly to add/remove announcement cards.
- **Hub cards use front matter contracts**:
  - Manual hubs: `hubs` + optional `hubs_class`
  - Automatic hub groups: `autohub.category`, `autohub.text`, `autohub.img`, optional `autohub.img_position`
- **Post permalinks/categories matter**: existing posts commonly use category-based URLs (`/:categories/:title`) and category archives are generated from `site.categories`.
- **Embedded lecture videos** should use the custom Liquid tag (`{% youtube VIDEO_ID %}`) instead of raw iframe HTML when possible.
- **Legacy CI scripts exist in `_scripts/`** (`build.sh`, `deploy.sh`, `check_new_posts.sh`) but current production deployment source of truth is GitHub Actions workflow in `.github/workflows/jekyll.yml`.
