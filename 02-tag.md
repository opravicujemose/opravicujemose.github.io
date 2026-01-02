---
layout: default
title: Ključne besede - seznam
permalink: /tag/
---

<h2>Ključne besede</h2>
<h4>v podkastu Opravičujemo se za vse nevšečnosti</h4>
<p>Seznam ključnih besed podkasta <a href="../">Opravičujemo se za vse nevšečnosti</a>, v katerem se v {{ site.posts | size }} epizodah prepletajo Douglas Adams, politika, družba, religija, znanost, tehnologija in alkohol (predvsem pivo), ob tem pa še vsakdanje malenkosti, humor, nostalgija in debate od kapitalizma do teorij zarot, od Vsemogočnega Boba do čajnih bogatih.</p>

<!-- KODA ZA TAGE -->

{% assign book_tags = "Štoparski vodnik po Galaksiji, Restavracija ob koncu Vesolja, O življenju vesolju in sploh vsem, Zbogom in hvala za vse ribe, Pretežno neškodljiva, Pa še tole, Zadnja priložnost" | split: ", " %}

{% assign character_tags = "Artur Dent, Ford Prefect, Zaphod Beeblebrox, Fenchurch, Tricia McMillan, Trillian,  gospod Prosser, Random Dent, Slartibartfast, Ovečeni Velepotež, Hillman Hunter, Marvin, Rob McKenna, Vogoni, Thor, Vročečrni Desiato" | split: ", " %}

{% assign excluded_tags = "komad tedna" | split: ", " %}

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

<h4 class="tags-heading">Knjige</h4>
<div class="tags-list small-tags">
{%- assign comma_needed = false -%}

{%- for item in sortedtags -%}
  {%- assign parts = item | split:'|||' -%}
  {%- assign name_and_count = parts[1] | split:'###' -%}
  {%- assign name = name_and_count[0] | strip -%}
  {%- assign count = name_and_count[1] | plus: 0 -%}
  
  {%- if name == "Pretežno neškodljiva" -%}
    <a class="tag" href="/tag/pretezno-neskodljiva/" style="font-size: 1.1em;">{{ name }}{% if count > 1 %} ({{ count }}×){% endif %}</a>
    {%- assign comma_needed = true -%}
  {%- endif -%}
{%- endfor -%}

{%- for item in sortedtags -%}
  {%- assign parts = item | split:'|||' -%}
  {%- assign name_and_count = parts[1] | split:'###' -%}
  {%- assign name = name_and_count[0] | strip -%}
  {%- assign count = name_and_count[1] | plus: 0 -%}

  {%- if book_tags contains name and name != "Pretežno neškodljiva" -%}
    {%- if comma_needed -%}, {% endif -%}
    {%- assign slug = name | downcase | replace: 'č','c' | replace: 'š','s' | replace: 'ž','z' | replace: ' ','-' -%}
    {%- assign weight = count | times: 1.0 | divided_by: max_count -%}
    {%- assign font_size = 0.3 | times: weight | plus: 0.9 -%}

    <a class="tag" href="/tag/{{ slug | url_encode }}/" style="font-size: {{ font_size | round: 2 }}em;">{{ name }}{% if count > 1 %} ({{ count }}×){% endif %}</a>
    {%- assign comma_needed = true -%}
  {%- endif -%}
{%- endfor -%}

</div>

<h4 class="tags-heading">Glavni junaki</h4>
<div class="tags-list">
{%- assign comma_needed = false -%}
{%- for item in sortedtags -%}
  {%- assign parts = item | split:'|||' -%}
  {%- assign name_and_count = parts[1] | split:'###' -%}
  {%- assign name = name_and_count[0] | strip -%}
  {%- assign count = name_and_count[1] | plus: 0 -%}

  {%- if character_tags contains name -%}
    {%- if comma_needed -%}, {% endif -%}
    {%- assign slug = name | downcase | replace: 'č','c' | replace: 'š','s' | replace: 'ž','z' | replace: ' ','-' -%}
    {%- assign weight = count | times: 1.0 | divided_by: max_count -%}
    {%- assign font_size = 0.6 | times: weight | plus: 1.0 -%}

    <a class="tag" href="/tag/{{ slug | url_encode }}/" style="font-size: {{ font_size | round: 2 }}em;">{{ name }}{% if count > 1 %} ({{ count }}×){% endif %}</a>
    {%- assign comma_needed = true -%}
  {%- endif -%}
{%- endfor -%}
</div>

<h4 class="tags-heading">Ključne besede</h4>
<div class="tags-list">
{%- assign comma_needed = false -%}
{%- for item in sortedtags -%}
  {%- assign parts = item | split:'|||' -%}
  {%- assign name_and_count = parts[1] | split:'###' -%}
  {%- assign name = name_and_count[0] | strip -%}
  {%- assign count = name_and_count[1] | plus: 0 -%}

  {%- unless book_tags contains name or character_tags contains name or excluded_tags contains name -%}
    {%- if comma_needed -%}, {% endif -%}
    {%- assign slug = name | downcase | replace: 'č','c' | replace: 'š','s' | replace: 'ž','z' | replace: ' ','-' -%}
    {%- assign weight = count | times: 1.0 | divided_by: max_count -%}
    {%- assign font_size = 1.0 | times: weight | plus: 1.0 -%}

    <a class="tag" href="/tag/{{ slug | url_encode }}/" style="font-size: {{ font_size | round: 2 }}em;">{{ name }}{% if count > 1 %} ({{ count }}×){% endif %}</a>
    {%- assign comma_needed = true -%}
  {%- endunless -%}
{%- endfor -%}
</div>
