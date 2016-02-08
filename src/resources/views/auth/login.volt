{% extends 'main/plain.volt' %}

{% block page_title %}
Welcome!
{% endblock %}

{% block header %}
{% endblock %}

{% block content %}
<div class="container">
    <div class="login-box">
        <div>
            <div class="login-form row">
                <div class="col-sm-12 text-center login-header">
                    <i class="login-logo fa fa-connectdevelop fa-5x"></i>
                    <h4 class="login-title">Login</h4>
                </div>
                <div class="col-sm-12">

                    {# Error Messages #}
                    {% if di().get('flash').has('error')  %}
                        <div class="alert alert-danger">
                            {{ di().get('flash').get('error') }}
                        </div>
                    {% endif %}

                    <div class="login-body">
                        <div class="progress hidden" id="login-progress">
                            <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                Log In...
                            </div>
                        </div>
                        <form method="POST" action="{{ route('daison_postLogin') }}">
                            <div class="control">
                                <input type="email" name="email" class="form-control" placeholder="admin@gmail.com" />
                            </div>
                            <div class="control">
                                <input type="password" name="password" class="form-control" placeholder="123456" />
                            </div>
                            <div class="login-button text-center">
                                <input type="submit" class="btn btn-primary" value="Login">
                            </div>
                        </form>
                    </div>
                    <div class="login-footer">
                        <span class="text-right"><a href="#" class="color-white">Forgot password?</a></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{% endblock %}

{% block footer %}
{% endblock %}
