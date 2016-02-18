{% extends 'main/base.volt' %}

{% block title %}User Profiles{% endblock %}

{% block page_title %}User Profiles{% endblock %}

{% block header %}
{% endblock %}

{% block content %}

<div id="pjax-container"></div>

<div id="main-container">

    {{ partial("util/alerts/error") }}

    {{ partial("util/alerts/success") }}

    <div class="page-title">
        <span class="title">Users</span>
        <div class="description">you can manage all registered users here.</div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <form method="GET" action="{{ url(route('daison_showUsers')) }}">
                    <div class="card-header">
                        <div class="card-title">
                            <a href="{{ url(route('daison_showUsers')) }}" title="Refresh" id="globalRefresh" class="btn btn-default"><span class="fa fa-refresh"></span></a>
                            <button title="Download as CSV" id="globalDownload" type="button" class="btn btn-primary"><span class="fa fa-download"></span></button>
                            <button title="Delete selected lists" id="globalDelete" type="button" class="hidden btn btn-danger"><span class="fa fa-trash"></span></button>
                        </div>
                        <div class="card-title" style="float:right;">
                            {{ paginator.render() }}
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="table-handler" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>
                                            <div class="checkbox3 checkbox-inline checkbox-check checkbox-light">
                                                <input type="checkbox" id="mother-checkbox" class="checkbox-control">
                                                <label for="mother-checkbox">&nbsp;</label>
                                            </div>
                                        </th>
                                        <th><input name="search[email]" placeholder="Email" type="text" class="form-control input-table"></th>
                                        <th><input name="search[name]" placeholder="Name" type="text" class="form-control input-table"></th>
                                        <th><input name="search[created_at]" placeholder="Created At" type="text" class="form-control input-table"></th>
                                        <th><input name="search[activated]" placeholder="Activated" type="text" class="form-control input-table"></th>
                                        <th>
                                            <button type="submit" class="btn-block btn btn-info"><span class="fa fa-search"></span> Search</button>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                {% for item in paginator.items() %}
                                <tr>
                                    <td>
                                        <div class="checkbox3 checkbox-inline checkbox-check checkbox-light">
                                            <input name="delete[{{ item.id }}]" type="checkbox" id="checkbox-item-{{ item.id }}" class="child-checkbox">
                                            <label for="checkbox-item-{{ item.id }}"></label>
                                        </div>
                                    </td>
                                    <td>{{ item.getEmail() }}</td>
                                    <td>{{ item.getName() }}</td>
                                    <td>{{ date('F j, Y g:i a', strtotime(item.getCreatedAt())) }}</td>
                                    <td>{{ item.getActivated() ? 'Yes' : 'No' }}</td>
                                    <td class="text-right">
                                        <a title="Edit" data-pjax="#pjax-container" class="btn btn-xs btn-primary" href="{{ url(route('daison_editUser', ['id' : item.id])) }}"><span class="fa fa-pencil"></span></a>
                                        <a title="View" data-pjax="#pjax-container" class="btn btn-xs btn-info" href="{{ url(route('daison_viewUser', ['id' : item.id])) }}"><span class="fa fa-eye"></span></a>
                                        <a title="Delete" data-pjax="#pjax-container" class="btn btn-xs btn-danger" href="{{ url(route('daison_deleteUser', ['id': item.id])) }}"><span class="fa fa-trash"></span></a>
                                        <a title="Resend Confirmation Email" data-pjax="#pjax-container" class="btn btn-xs btn-warning" href="{{ url(route('daison_resendConfirmationUser', ['id': item.id])) }}"><span class="fa fa-paper-plane"></span></a>
                                    </td>
                                </tr>
                                {% endfor %}
                                </tbody>
                            </table>
                            <div class="alert alert-success">
                                <div class="pull-right">
                                    <strong>Total Number of Records:</strong> {{ paginator.total_items() }}
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
{% endblock %}

{% block footer %}
<script type="text/javascript" src="{{ url('vendor/daisonAdmin/bower_components/jquery-pjax/jquery.pjax.js') }}"></script>
<script type="text/javascript">
    $(function() {

        // Progress Bar on top

        $(document).on('pjax:start', function() {
            NProgress.start();
        });

        $(document).on('pjax:end', function() {
            NProgress.done();
            $("#modalDefault").modal("show");
        });


        // Applying pjax for no-refresh scene

        if ( $.support.pjax )
        {
            $(document).on("click", "a[data-pjax]", function(event) {
                $.pjax.click(event, "#pjax-container", {
                    fragment: "#pjax-container",
                    push: false,
                    timeout: 10000
                });
            });

            $(document).on("click", "#globalRefresh", function(event) {
                $.pjax.click(event, "#main-container", {
                    fragment: "#main-container",
                    push: false,
                    timeout: 10000
                });
            });
        }


        // Common, planning to move on a separate js file

        function showDeleteBtn(bool)
        {
            if ( bool === true )
            {
                $("#globalDelete").removeClass("hidden");
            }
            else
            {
                $("#globalDelete").addClass("hidden");
            }
        }

        $(document).on("change", "#mother-checkbox", function() {

            var childBoxes = $(this).closest("#table-handler").find(".child-checkbox");

            if ( $(this).is(":checked") )
            {
                childBoxes.prop("checked", true);
                showDeleteBtn(true);
            }
            else
            {
                childBoxes.prop("checked", false);
                showDeleteBtn(false);
            }
        });

        $(document).on("change", ".child-checkbox", function()
        {
            if ( $(".child-checkbox:checked").length )
            {
                showDeleteBtn(true);
            }
            else
            {
                showDeleteBtn(false);
            }
        });
    });
</script>
{% endblock %}
