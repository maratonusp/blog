---
title: USP na Final Latino Americana
layout: page
permalink: usp_latam.html
autohub:
  category: historia
  text: USP nas finais latino americanas
  img: images/latam_finals/codando_latam.jpg
  img_position: 50% 30%
awards:
- champion:
    symbol: trophy
    color: "#ffd700"
    name: Campeão
- gold:
    symbol: star
    color: "#ffd700"
    name: Medalha de ouro
- silver:
    symbol: star
    color: "#c0c0c0"
    name: Medalha de prata
- bronze:
    symbol: star
    color: "#cd7f32"
    name: Medalha de bronze
- wf:
    symbol: globe
    color: green
    name: Classificado para a WF
history:
- title: Asunción, Paraguai, Março de 2026
  year: 2026
  name: "Here's my number: 998244353, so call me maybe"
  members: Pedro Miguelez, Cauê Fornielles da Costa e Pedro Matheus Simões Ferreira
  coaches: Yan Soares Couto
  img: /~maratona/images/latam2026-heres.jpg
  img_href: /~maratona/images/latam2026-heres.jpg
  place: 30
  score: https://scorelatam.naquadah.com.br/pda26/

- title: Salvador, Brasil, Março de 2025
  year: 2025
  name: Faça o WM
  members: Willian Miura Mori, Nathan Martins e Antonio Hachisuca
  coaches: Enrique Junchaya
  img: /~maratona/images/latam2025-wm.jpg
  img_href: /~maratona/images/latam2025-wm.jpg
  place: 1
  score: https://scorelatam.naquadah.com.br/pda25/
  awards:
    - wf
    - gold
    - champion

- title: Guadalajara, México, Março de 2024
  year: 2024
  name: Codando & Coringando
  members: Luan Arcanjo, Nathan Martins e Willian Mori
  coaches: Enrique Junchaya e Gabriel Morete de Azevedo
  img: images/latam_finals/codando_latam.jpg
  img_href: images/latam_finals/codando_latam.jpg
  place: 4
  score: https://scorelatam.naquadah.com.br/pda24/
  awards:
    - wf
    - gold
---

Os resultados de times da USP (Campus Butantã) nas [Finais Latino-americanas do ICPC](https://icpc.global/regionals/finder/Latin-America-Champ) foram os seguintes:
{% for award_hash in page.awards %}{% for award in award_hash %}
{% capture times %}{% for team in page.history %}{% if team.awards contains award[0] %}, {{ team.year }}{% endif %}{% endfor %}){% endcapture %}
{% if times != ")" %}
- <i class="fa fa-{{ award[1].symbol }}" style="color:{{ award[1].color }}" title="{{ award[1].name }}"></i> {{ award[1].name }}: {{ times | split: "," | size | minus: 1}} {{ times | replace_first: ", ", "(" }}
{% endif %}
{% endfor %}{% endfor %}

<ul class="history-list">
{% for item in page.history %}
<li class="big">
{% if item.img %}
  <a target="_blank" href="{{ item.img_href }}"><img src="{{ item.img }}"></a>
{% endif %}
<h4>
 <a target="_blank" href="https://icpc.baylor.edu/community/history-icpc-{{ item.year }}">{{ item.title }}</a>
</h4>
<p>
{% if item.awards %}
{% for award_hash in page.awards %}{% for award in award_hash %}
  {% if item.awards contains award[0] %}<i class="fa fa-{{ award[1].symbol }}" style="color:{{ award[1].color }}" title="{{ award[1].name }}"></i>{% endif %}
{% endfor %} {% endfor %}
{% endif %}
<a href="{% if item.score %}{{ item.score }}{% else %}http://static.kattis.com/icpc/wf{{ item.year }}/{% endif %}" title="placar"><i class="fa fa-th-list" title="Placar"></i> Colocação: {{ item.place }}</a><br>
{% if item.name %}<b>{{ item.name }}</b><br>{% endif %}
Time: {{ item.members }}. <br>
Coaches: {{ item.coaches }}.
{% if item.text %}<br>{{ item.text }}{% endif %}
</p>
</li>
{% endfor %}
</ul>
