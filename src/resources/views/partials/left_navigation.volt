<li class="{{ (left_navigation == 'dashboard') ? 'active' : '' }}">
    <a href="{{ url(route('daison_mainRouteManager')) }}">
        <span class="icon fa fa-tachometer"></span><span class="title">Dashboard</span>
    </a>
</li>
<li class="{{ (left_navigation == 'userLists') ? 'active' : '' }}">
    <a href="{{ url(route('daison_showUsers')) }}">
        <span class="icon fa fa-user"></span><span class="title">Users</span>
    </a>
</li>
