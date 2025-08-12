<h4>Sezone:
{% assign seasons = "01,02,03,04,05,06,07" | split: "," %}
{% for n in seasons %}
  {% assign label = 'S' | append: n %}
  {% if page.season == n %}
    {{ label }}
  {% else %}
    <a href="../{{ n }}">{{ label }}</a>
  {% endif %}
  {% unless forloop.last %} | {% endunless %}
{% endfor %}
</h4>
