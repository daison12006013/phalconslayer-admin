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

    <div class="page-title">
        <span class="title">Users</span>
        <div class="description">you can manage all registered users here.</div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <!-- <div class="card-header">
                    <div class="card-title">
                        <div class="title">Users Lists</div>
                    </div>
                </div> -->
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
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
                                    <a class="btn btn-xs btn-primary" href="{{ url(route('daison_editUser', ['id' : user.id])) }}">Edit</a>
                                    <a class="btn btn-xs btn-info" href="{{ url(route('daison_viewUser', ['id' : user.id])) }}">View</a>
                                    <a class="btn btn-xs btn-danger" href="#">Delete</a>
                                </td>
                            </tr>
                            {% endfor %}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{% endblock %}

{% block footer %}
{% endblock %}
