---
layout: default
title: Ključne besede - seznam
permalink: /tag/
---

<h1>Ključne besede</h1>

<p>Seznam ključnih besed v podkastu <a href="../">Opravičujemo se za vse nevšečnosti</a>!

<div class="tags-list">

{% capture temptags %}
{% for tag in site.tags %}
{{ tag[1].size | plus: 1000 }}|||{{ tag[0] }}<br />
{% endfor %}
{% endcapture %}

{% assign sortedtags = temptags | split:'<br />' | sort | reverse %}

{% assign max_count = 0 %}
{% for tag in site.tags %}
  {% if tag[1].size > max_count %}
    {% assign max_count = tag[1].size %}
  {% endif %}
{% endfor %}

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

<!-- LINEARNI TAG CLOUD -->

{% assign min_size = 1.1 %}
{% assign max_size = 2.0 %}
{% assign range = max_size | minus: min_size %}
{% assign weight = count | times: 1.0 | divided_by: max_count %}
{% assign font_size = range | times: weight | plus: min_size %}

<a class="tag" href="/tag/{{ slug }}/" style="font-size: {{ font_size | round: 2 }}em;">{{ name }}{% if count > 1 %} ({{ count }}×){% endif %}</a>{% unless forloop.last %}, {% endunless %}

{% endif %}
{% endfor %}

</div>