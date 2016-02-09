{% extends 'main/base.volt' %}

{% block title %}
{{ target_user.getName() }}
{% endblock %}

{% block page_title %}
{{ target_user.getName() }}
{% endblock %}

{% block header %}
{% endblock %}

{% block content %}
<div class="container">
    <div class="form">
        <form method="POST">
            <div class="form-group">
                <label for="name">Name</label>
                <input class="form-control" id="name" name="" />
            </div>
        </form>
    </div>
</div>
{% endblock %}

{% block footer %}
{% endblock %}
