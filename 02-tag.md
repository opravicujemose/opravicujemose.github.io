---
layout: default
title: Ključne besede - seznam
permalink: /tag/
---

<h1>Ključne besede</h1>

<div class="tags-list">
{% capture temptags %}
{% for tag in site.tags %}
{{ tag[1].size | plus: 1000 }}|||{{ tag[0] }}<br />
{% endfor %}
{% endcapture %}

{% assign sortedtags = temptags | split:'<br />' | sort | reverse %}

{% for item in sortedtags %}
{% if item != "" %}
{% assign parts = item | split:'|||' %}
{% assign count = parts[0] | minus: 1000 %}
{% assign name = parts[1] | strip %}

{% assign slug = name
  | downcase
  | replace: 'č','c'
  | replace: 'š','s'
  | replace: 'ž','z'
  | replace: 'ć','c'
  | replace: 'đ','d'
  | replace: ' ','-'
%}

<a class="tag" href="/tag/{{ slug }}/">{{ name }}{% if count > 1 %} ({{ count }}×){% endif %}</a>{% unless forloop.last %}, {% endunless %}
{% endif %}
{% endfor %}
</div>