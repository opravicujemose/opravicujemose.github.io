---
layout: default
title: Komad tedna - Opravičujemo se za vse nevšečnosti
permalink: /komad-tedna/
image:  /assets/img/opr-komad-tedna@2x.jpg
description: Seznam komadov tedna, ki so se pojavili v podkastu Opravičujemo se za vse nevšečnosti. Seznam, ki nima posebnega smisla, ima pa dušo.
---

<h2>Komadi tedna</h2>
<p>Seznam vseh komadov tedna, ki so se pojavili v podkastu <a href="/">Opravičujemo se za vse nevšečnosti</a>.</p>

{% for post in site.posts %}
  {% if post.songoftheweek %}
    {% assign yaml_count = yaml_count | plus: post.songoftheweek.size %}
  {% endif %}
{% endfor %}

<div class="songs-list">

{% for post in site.posts %}
  {% if post.songoftheweek %}
    {% for song in post.songoftheweek %}

      {% assign yt_id = song.youtube | split: 'v=' | last | split: '&' | first %}
      {% assign yt_thumb = "https://img.youtube.com/vi/" | append: yt_id | append: "/hqdefault.jpg" %}

      <div class="song-item">

        <h3 class="song-title">
          <a href="{{ song.youtube }}" target="_blank" rel="noopener">
            {{ song.artist }} – <i>{{ song.title }}</i></a> {% if song.year %} ({{ song.year }}){% endif %}
        </h3>

        <div class="song-body">

          <div class="song-thumb">
            <img
              src="{{ yt_thumb }}"
              alt="{{ song.artist }} – {{ song.title }}"
              loading="lazy">
          </div>

          <div class="song-meta">
            {% if song.note %}
              <p class="song-note">{{ song.note }}</p>
            {% endif %}

            <p class="song-episode">
              🎧 <a href="{{ post.url }}">{{ post.number }} – {{ post.title }}</a>
            </p>

          </div>

        </div>

      </div>

    {% endfor %}
  {% endif %}
{% endfor %}

</div>