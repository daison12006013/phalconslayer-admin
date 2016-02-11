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
    <body class="flat-blue login-page">
        {% block content %}{% endblock %}

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
        </div>
        {% block footer %}{% endblock %}
    </body>
</html>