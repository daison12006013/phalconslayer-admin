{% extends 'main/base.volt' %}

{% block title %}User Profiles{% endblock %}

{% block page_title %}User Profiles{% endblock %}

{% block header %}
{% endblock %}

{% block content %}
<div class="container">
    {# Error Messages #}
    {% if di().get('flash').has('error')  %}
        <div class="alert alert-danger">
            {{ di().get('flash').get('error') }}
        </div>
    {% endif %}

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Email</th>
                <th>Name</th>
                <th>Created At</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        {% for user in users %}
        <tr>
            <td>{{ user.id }}</td>
            <td>{{ user.getEmail() }}</td>
            <td>{{ user.getName() }}</td>
            <td>{{ user.getCreatedAt() }}</td>
            <td>
                <a class="btn btn-xs btn-info" href="{{ url(route('daison_editUser', ['id' : user.id])) }}">Edit</a>
            </td>
        </tr>
        {% endfor %}
        </tbody>
    </table>
</div>
{% endblock %}

{% block footer %}
{% endblock %}
