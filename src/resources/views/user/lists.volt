{% extends 'main/base.volt' %}

{% block title %}User Profiles{% endblock %}

{% block page_title %}User Profiles{% endblock %}

{% block header %}
{% endblock %}

{% block content %}

<div id="pjax-container"></div>

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
                <div class="card-header">
                    <div class="card-title">
                        <button id="globalDownload" type="button" class="btn btn-primary"><span class="fa fa-download"></span></button>
                        <button id="globalDelete" type="button" class="hidden btn btn-default"><span class="fa fa-trash"></span></button>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="checkbox-handler table table-hover">
                            <thead>
                                <!-- <tr>
                                    <th><input type="checkbox"></th>
                                    <th>Email</th>
                                    <th>Name</th>
                                    <th>Created At</th>
                                    <th>Activated</th>
                                    <th></th>
                                </tr> -->
                                <tr>
                                    <th><input type="checkbox" class="head-checkbox checkbox-control"></th>
                                    <th><input placeholder="Email" type="text" class="form-control input-table"></th>
                                    <th><input placeholder="Name" type="text" class="form-control input-table"></th>
                                    <th><input placeholder="Created At" type="text" class="form-control input-table"></th>
                                    <th><input placeholder="Activated" type="text" class="form-control input-table"></th>
                                    <th>
                                        <button type="button" class="btn-block btn btn-info"><span class="fa fa-search"></span> Search</button>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            {% for user in users %}
                            <tr>
                                <td><input class="child-checkbox" type="checkbox"></td>
                                <td>{{ user.getEmail() }}</td>
                                <td>{{ user.getName() }}</td>
                                <td>{{ date('F j, Y g:i a', strtotime(user.getCreatedAt())) }}</td>
                                <td>{{ user.getActivated() ? 'Yes' : 'No' }}</td>
                                <td>
                                    <a data-pjax="#pjax-container" class="btn btn-xs btn-primary" href="{{ url(route('daison_editUser', ['id' : user.id])) }}">Edit</a>
                                    <a data-pjax="#pjax-container" class="btn btn-xs btn-info" href="{{ url(route('daison_viewUser', ['id' : user.id])) }}">View</a>
                                    <a data-pjax="#pjax-container" class="btn btn-xs btn-danger" href="{{ url(route('daison_deleteUser', ['id': user.id])) }}">Delete</a>
                                    <a data-pjax="#pjax-container" class="btn btn-xs btn-warning" href="{{ url(route('daison_resendConfirmationUser', ['id': user.id])) }}">Resend Confirmation Email</a>
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

        $(document).on('pjax:start', function() {
            NProgress.start();
        });

        $(document).on('pjax:end', function() {
            NProgress.done();
            $("#modalDefault").modal("show");
        });

        if ( $.support.pjax ) {
            $(document).on("click", "a[data-pjax]", function(event) {
                $.pjax.click(event, "#pjax-container", {
                    fragment: "#pjax-container",
                    push: false,
                    timeout: 10000
                });
            });
        }

        $(".head-checkbox").on("change", function() {

            var $childBoxes = $(this).closest(".checkbox-handler").find(".child-checkbox");

            if ( $(this).is(":checked") ) {
                $("#globalDelete").removeClass("hidden");

                $childBoxes.prop("checked", true);
            } else {
                $("#globalDelete").addClass("hidden");

                $childBoxes.prop("checked", false);
            }
        });
    });
</script>
{% endblock %}
