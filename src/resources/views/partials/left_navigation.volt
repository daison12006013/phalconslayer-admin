<li class="{{ (left_navigation == 'dashboard') ? 'active' : '' }}">
    <a href="{{ url(route('daison_mainRouteManager')) }}">
        <span class="icon fa fa-tachometer"></span><span class="title">Dashboard</span>
    </a>
</li>
<li class="panel panel-default dropdown">
    <a data-toggle="collapse" href="#userManagement">
        <span class="icon fa fa-user"></span><span class="title">User Management</span>
    </a>
    <!-- Dropdown level 1 -->
    <div id="userManagement" class="panel-collapse collapse">
        <div class="panel-body">
            <ul class="nav navbar-nav">
                <li class="{{ (left_navigation == 'userLists') ? 'active' : '' }}">
                    <a href="{{ url(route('daison_showUsers')) }}">Users</a>
                </li>
                <li class="{{ (left_navigation == 'roleLists') ? 'active' : '' }}">
                    <a href="#">Roles</a>
                </li>
            </ul>
        </div>
    </div>
</li>