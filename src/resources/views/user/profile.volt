{% extends 'main/base.volt' %}

{% block page_title %}
{{ user.getName() }}'s Profile!
{% endblock %}

{% block header %}
{% endblock %}

{% block content %}
<ul>
    <li>Name: {{ user.getName() }}</li>
    <li>Email: {{ user.getEmail() }}</li>
</ul>
{% endblock %}

{% block footer %}
{% endblock %}
