---
layout: default
title: Komadi tedna
permalink: /komad-tedna/
---

<h2>Komadi tedna</h2>
<p>Seznam vseh komadov tedna, ki so se pojavili v podkastu <a href="/">Opravičujemo se za vse nevšečnosti</a>.</p>

{% assign tag_komad = site.tags["komad tedna"] %}
{% assign yaml_count = 0 %}

{% for post in site.posts %}
  {% if post.songoftheweek %}
    {% assign yaml_count = yaml_count | plus: post.songoftheweek.size %}
  {% endif %}
{% endfor %}

<p class="songs-counter">
  🎵 Tagi: <strong>{{ tag_komad | size }}</strong> 🎶 YAML: <strong>{{ yaml_count }}</strong><br>
    ⏳ Manjka še: <strong>{{ tag_komad | size | minus: yaml_count }}</strong>
</p>

<div class="songs-list">

{% for post in site.posts %}
  {% if post.songoftheweek %}
    {% for song in post.songoftheweek %}

      {% assign yt_id = song.youtube | split: 'v=' | last | split: '&' | first %}
      {% assign yt_thumb = "https://img.youtube.com/vi/" | append: yt_id | append: "/hqdefault.jpg" %}

      <div class="song-item">

        <h3 class="song-title">
          <a href="{{ song.youtube }}" target="_blank" rel="noopener">
            {{ song.artist }} – {{ song.title }}
          </a>
          {% if song.year %} ({{ song.year }}){% endif %}
        </h3>

        <div class="song-body">

          <div class="song-thumb">
            <img
              src="{{ yt_thumb }}"
              alt="{{ song.artist }} – {{ song.title }}"
              loading="lazy"
              style="max-height: 80px;"
            >
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