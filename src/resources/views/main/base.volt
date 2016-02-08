<!DOCTYPE html>
<html>
    <head>
        <title>{% block title %}{% endblock %}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>

        <!-- CSS Libs -->
        <link rel="stylesheet" type="text/css" href="{{ url('vendor/daisonAdmin/bower_components/bootstrap/dist/css/bootstrap.min.css') }}">
        <link rel="stylesheet" type="text/css" href="{{ url('vendor/daisonAdmin/bower_components/font-awesome/css/font-awesome.min.css') }}">
        <link rel="stylesheet" type="text/css" href="{{ url('vendor/daisonAdmin/bower_components/animate.css/animate.min.css') }}">
        <link rel="stylesheet" type="text/css" href="{{ url('vendor/daisonAdmin/bower_components/bootstrap-switch/dist/css/bootstrap3/bootstrap-switch.min.css') }}">
        <link rel="stylesheet" type="text/css" href="{{ url('vendor/daisonAdmin/bower_components/checkbox3/dist/checkbox3.min.css') }}">
        <link rel="stylesheet" type="text/css" href="{{ url('vendor/daisonAdmin/bower_components/DataTables/media/css/jquery.dataTables.min.css') }}">
        <link rel="stylesheet" type="text/css" href="{{ url('vendor/daisonAdmin/bower_components/datatables/media/css/dataTables.bootstrap.css') }}">
        <link rel="stylesheet" type="text/css" href="{{ url('vendor/daisonAdmin/bower_components/select2/dist/css/select2.min.css') }}">

        <!-- CSS App -->
        <link rel="stylesheet" type="text/css" href="{{ url('vendor/daisonAdmin/css/style.css') }}">
        <link rel="stylesheet" type="text/css" href="{{ url('vendor/daisonAdmin/css/themes/flat-blue.css') }}">

        {% block header %}{% endblock %}
    </head>
    <body class="flat-blue">

        <div class="app-container">
            <div class="row content-container">
                <nav class="navbar navbar-default navbar-fixed-top navbar-top">
                    {{ partial('partials/top_navigation') }}
                </nav>
                <div class="side-menu sidebar-inverse">
                    <nav class="navbar navbar-default" role="navigation">
                        <div class="side-menu-container">
                            <div class="navbar-header">
                                <a class="navbar-brand" href="#">
                                    <div class="icon fa fa-paper-plane"></div>
                                    <div class="title">{% block page_title %}{% endblock %}</div>
                                </a>
                                <button type="button" class="navbar-expand-toggle pull-right visible-xs">
                                    <i class="fa fa-times icon"></i>
                                </button>
                            </div>
                            <ul class="nav navbar-nav">
                                {{ partial('partials/left_navigation') }}
                            </ul>
                        </div>
                        <!-- /.navbar-collapse -->
                    </nav>
                </div>
                <!-- Main Content -->
                <div class="container-fluid">
                    <div class="side-body padding-top">
                        {% block content %}{% endblock %}
                    </div>
                </div>
            </div>
            <footer class="app-footer">
                {{ partial('partials/footer') }}
            </footer>
        </div>

        <div>
            <!-- Javascript Libs -->
            <script type="text/javascript" src="{{ url('vendor/daisonAdmin/bower_components/jquery/dist/jquery.min.js') }}"></script>
            <script type="text/javascript" src="{{ url('vendor/daisonAdmin/bower_components/bootstrap/dist/js/bootstrap.min.js') }}"></script>
            <script type="text/javascript" src="{{ url('vendor/daisonAdmin/bower_components/Chart.js/Chart.min.js') }}"></script>
            <script type="text/javascript" src="{{ url('vendor/daisonAdmin/bower_components/bootstrap-switch/dist/js/bootstrap-switch.min.js') }}"></script>
            <script type="text/javascript" src="{{ url('vendor/daisonAdmin/bower_components/matchHeight/jquery.matchHeight-min.js') }}"></script>
            <script type="text/javascript" src="{{ url('vendor/daisonAdmin/bower_components/DataTables/media/js/jquery.dataTables.min.js') }}"></script>
            <script type="text/javascript" src="{{ url('vendor/daisonAdmin/bower_components/DataTables/media/js/dataTables.bootstrap.min.js') }}"></script>
            <script type="text/javascript" src="{{ url('vendor/daisonAdmin/bower_components/select2/dist/js/select2.full.min.js') }}"></script>
            <script type="text/javascript" src="{{ url('vendor/daisonAdmin/bower_components/ace-builds/src/ace.js') }}"></script>
            <script type="text/javascript" src="{{ url('vendor/daisonAdmin/bower_components/ace-builds/src/mode-html.js') }}"></script>
            <script type="text/javascript" src="{{ url('vendor/daisonAdmin/bower_components/ace-builds/src/theme-github.js') }}"></script>
            <!-- Javascript -->
            <script type="text/javascript" src="{{ url('vendor/daisonAdmin/js/app.js') }}"></script>
            <script type="text/javascript" src="{{ url('vendor/daisonAdmin/js/index.js') }}"></script>
        </div>
        {% block footer %}{% endblock %}
    </body>
</html>