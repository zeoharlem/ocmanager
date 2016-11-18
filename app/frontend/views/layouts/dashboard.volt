{% extends "templates/base.volt" %}

{% block head %}
{% endblock %}
{% block content %}

<div class="animate-dropdown"><!-- ========================================= BREADCRUMB ========================================= -->
<div id="breadcrumb-alt">
    <div class="container">
        <div class="breadcrumb-nav-holder minimal">
            <ul>
                <li class="dropdown breadcrumb-item">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        Dashboard Menu Bar
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="{{url('dashboard?token='~session.get('auth')['email'])}}">Dashboard / Home</a></li>
                        <li><a href="#">Change Password</a></li>
                    </ul>
                </li>
                <li class="breadcrumb-item">
                    <a href="{{url('customer')}}">Track Orders</a>
                </li>
                <li class="breadcrumb-item current">
                    <a href="{{url('customer/getPack')}}">View Purchases</a>
                </li>
                <li class="breadcrumb-item pull-left">
                    <a href="{{url('logout')}}">Logout</a>
                </li>
            </ul><!-- /.breadcrumb-nav-holder -->
        </div>
    </div><!-- /.container -->
</div>
<!-- ========================================= BREADCRUMB : END ========================================= --></div>


{{this.getContent()}}
{% endblock %}
