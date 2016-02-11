{% extends 'main/base.volt' %}

{% block title %}User Profiles{% endblock %}

{% block page_title %}User Profiles{% endblock %}

{% block header %}
{% endblock %}

{% block content %}

<div id="userFormBody"></div>

<div>

    {{ partial("util/alerts/error") }}

    {{ partial("util/alerts/success") }}

    <div class="page-title">
        <span class="title">Users</span>
        <div class="description">you can manage all registered users here.</div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Email</th>
                                    <th>Name</th>
                                    <th>Created At</th>
                                    <th>Activated</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            {% for user in users %}
                            <tr>
                                <td>{{ user.id }}</td>
                                <td>{{ user.getEmail() }}</td>
                                <td>{{ user.getName() }}</td>
                                <td>{{ date('F j, Y g:i a', strtotime(user.getCreatedAt())) }}</td>
                                <td>{{ user.getActivated() ? 'Yes' : 'No' }}</td>
                                <td>
                                    <a data-pjax="#userFormBody" class="btn btn-xs btn-primary" href="{{ url(route('daison_editUser', ['id' : user.id])) }}">Edit</a>
                                    <a data-pjax="#userFormBody" class="btn btn-xs btn-info" href="{{ url(route('daison_viewUser', ['id' : user.id])) }}">View</a>
                                    <a data-pjax="#userFormBody" class="btn btn-xs btn-danger" href="{{ url(route('daison_deleteUser', ['id': user.id])) }}">Delete</a>
                                    <a data-pjax="#userFormBody" class="btn btn-xs btn-warning" href="{{ url(route('daison_resendConfirmationUser', ['id': user.id])) }}">Resend Confirmation Email</a>
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
<script type="text/javascript" src="{{ url('vendor/daisonAdmin/bower_components/jquery-pjax/jquery.pjax.js') }}"></script>
<script type="text/javascript">
    $(function() {

        if ($.support.pjax) {
            $(document).on("click", "a[data-pjax]", function(event) {

                $("#userFormBody").html("");

                $(document).on('pjax:start', function() {
                    NProgress.start();
                });

                $.pjax.click(event, "#userFormBody", {
                    fragment: "#userFormBody",
                    push: false,
                    timeout: 10000
                });

                event.preventDefault();

                $(document).on('pjax:end', function() {
                    NProgress.done();
                    $("#modalDefault").modal("show");
                });

            });
        }
    });
</script>
{% endblock %}
