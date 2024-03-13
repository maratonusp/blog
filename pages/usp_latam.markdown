---
title: USP na Final Latino Americana
layout: page
permalink: usp_latam.html
autohub:
  category: historia
  text: USP nas finais latino americanas
  img: https://www.ime.usp.br/~cef/maratonaUSP/usp-sp.jpg
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
- latinamerica:
    symbol: certificate
    color: blue
    name: Campeão da América Latina
history:
- title: Guadalajara, México, Março de 2024
  year: 2024
  members: Aluno 1, Aluno 2 e Aluno 3
  coaches: Enrique Junchaya e Gabriel Morete de Azevedo
  img: images/kondzhila-world-finals-2022.jpg
  img_href: images/kondzhila-world-finals-2022.jpg
  place: ??
  score: https://cphof.org/standings/icpc/2021
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
Time: {{ item.members }}. <br>
Coaches: {{ item.coaches }}.
{% if item.text %}<br>{{ item.text }}{% endif %}
</p>
</li>
{% endfor %}
</ul>
