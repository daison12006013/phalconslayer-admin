<div class="container-fluid">
    <div class="navbar-header">
        <button type="button" class="navbar-expand-toggle">
            <i class="fa fa-bars icon"></i>
        </button>
        <ol class="breadcrumb navbar-breadcrumb">
            <li class="active">{% block top_nav_title %}{% endblock %}</li>
        </ol>
        <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
            <i class="fa fa-th icon"></i>
        </button>
    </div>
    <ul class="nav navbar-nav navbar-right">
        <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
            <i class="fa fa-times icon"></i>
        </button>
        <!-- <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-comments-o"></i></a>
            <ul class="dropdown-menu animated fadeInDown">
                <li class="title">
                    Notification <span class="badge pull-right">0</span>
                </li>
                <li class="message">
                    No new notification
                </li>
            </ul>
        </li>
        <li class="dropdown danger">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-star-half-o"></i> 4</a>
            <ul class="dropdown-menu danger  animated fadeInDown">
                <li class="title">
                    Notification <span class="badge pull-right">4</span>
                </li>
                <li>
                    <ul class="list-group notifications">
                        <a href="#">
                            <li class="list-group-item">
                                <span class="badge">1</span> <i class="fa fa-exclamation-circle icon"></i> new registration
                            </li>
                        </a>
                        <a href="#">
                            <li class="list-group-item">
                                <span class="badge success">1</span> <i class="fa fa-check icon"></i> new orders
                            </li>
                        </a>
                        <a href="#">
                            <li class="list-group-item">
                                <span class="badge danger">2</span> <i class="fa fa-comments icon"></i> customers messages
                            </li>
                        </a>
                        <a href="#">
                            <li class="list-group-item message">
                                view all
                            </li>
                        </a>
                    </ul>
                </li>
            </ul>
        </li> -->
        <li class="dropdown profile">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">{{ user.getName() }} <span class="caret"></span></a>
            <ul class="dropdown-menu animated fadeInDown">
                <li class="profile-img">
                    <img src="<?php echo url('http://www.gravatar.com/avatar/'.md5($user->getEmail())) ?>" class="profile-img">
                </li>
                <li>
                    <div class="profile-info">
                        <h4 class="username">{{ user.getName() }}</h4>
                        <p>{{ user.getEmail() }}</p>
                        <div class="btn-group margin-bottom-2x" role="group">
                            <a href="{{ url(route('daison_viewUser', ['id': user.id])) }}" class="btn btn-default"><i class="fa fa-user"></i> Profile</a>
                            <a href="{{ url(route('daison_postLogout')) }}" class="btn btn-default"><i class="fa fa-sign-out"></i> Logout</a>
                        </div>
                    </div>
                </li>
            </ul>
        </li>
    </ul>
</div>