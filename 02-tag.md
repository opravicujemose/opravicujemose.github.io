---
layout: default
title: Ključne besede - seznam
permalink: /tag/
---

<h1>Ključne besede</h1>

<p>Seznam ključnih besed v najbolj divje netočnem podkastu <a href="../">Opravičujemo se za vse nevšečnosti</a>, v katerem se že skoraj 300 epizod prepletajo Douglas Adams, politika, družba, religija, znanost, tehnologija in alkohol (predvsem pivo), ob tem pa še vsakdanje malenkosti, eksistencialne dileme, humor, nostalgija in debate od kapitalizma do teorij zarot, od Vsemogočnega Boba do čajnih bogatih.</p> 

<div class="tags-list">
{%- capture temptags -%}
  {%- for tag in site.tags -%}
    {%- assign sort_weight = 1000 | minus: tag[1].size -%}
    {{ sort_weight }}###{{ tag[0] | downcase }}|||{{ tag[0] }}###{{ tag[1].size }}
    {%- unless forloop.last -%}:::{%- endunless -%}
  {%- endfor -%}
{%- endcapture -%}

{%- assign sortedtags = temptags | split:':::' | sort -%}

{%- assign max_count = 0 -%}
{%- for tag in site.tags -%}
  {%- if tag[1].size > max_count -%}
    {%- assign max_count = tag[1].size -%}
  {%- endif -%}
{%- endfor -%}

{%- for item in sortedtags -%}
  {%- assign main_parts = item | split:'|||' -%}
  {%- if main_parts.size > 1 -%}
    {%- assign name_and_count = main_parts[1] | split:'###' -%}
    {%- assign name = name_and_count[0] | strip -%}
    {%- assign count = name_and_count[1] | plus: 0 -%}

    {%- if name != "" -%}
      {%- assign slug = name
        | downcase
        | replace: 'č','c' | replace: 'š','s' | replace: 'ž','z'
        | replace: 'ć','c' | replace: 'đ','d' | replace: ' ','-'
      -%}

      {%- assign min_size = 1.0 -%}
      {%- assign max_size = 2.0 -%}
      {%- assign range = max_size | minus: min_size -%}
      {%- assign weight = count | times: 1.0 | divided_by: max_count -%}
      {%- assign font_size = range | times: weight | plus: min_size -%}

      <a class="tag" href="/tag/{{ slug | url_encode }}/" style="font-size: {{ font_size | round: 2 }}em;">{{ name }}{% if count > 1 %} ({{ count }}×){% endif %}</a>
      {%- if forloop.last == false -%}, {% endif -%}
    {%- endif -%}
  {%- endif -%}
{%- endfor -%}
</div>