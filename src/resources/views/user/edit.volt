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
<div id="pjax-container">
    <div class="modal fade modal-primary in" id="modalDefault" tabindex="-1" role="dialog" aria-labelledby="userFormTitle" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="form">
                    <form method="POST">

                        {% if is_pjax === true %}
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="userFormTitle">
                                    <span class="fa fa-pencil"></span>&nbsp;Edit Form
                                </h4>
                            </div>
                        {% else %}
                            <div class="page-title">
                                <span class="title">Edit User</span>
                                <div class="description">Update user's information.</div>
                            </div>
                        {% endif %}

                        <div class="modal-body" >
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input class="form-control" id="name" name="name" value="{{ target_user.getName() }}" />
                            </div>
                        </div>

                        {% if is_pjax === true %}
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary"><span class="fa fa-pencil"></span>&nbsp;Update Changes</button>
                            </div>
                        {% endif %}

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
{% endblock %}

{% block footer %}
{% endblock %}
