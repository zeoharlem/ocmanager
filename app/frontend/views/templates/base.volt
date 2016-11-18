
<!DOCTYPE html>
<html lang="en">


        <!-- Meta -->
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="keywords" content="Online Complain Manager">
        <meta name="robots" content="all">

        <title>Online Complain Manager</title>

        {{ this.assets.outputCss('headers') }}
            
        {% block head %} {% endblock %}
        

<body>
<div class="wrapper">
	    <div class="sidebar" data-background-color="brown" data-active-color="danger">
	    <!--
			Tip 1: you can change the color of the sidebar's background using: data-background-color="white | brown"
			Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
		-->
			<div class="logo">
				<a href="#" class="simple-text">
					OC / MANGER
				</a>
			</div>
			<div class="logo logo-mini">
				<a href="#" class="simple-text">
					Ct
				</a>
			</div>
	    	<div class="sidebar-wrapper">
				<div class="user">
	                <div class="photo">
	                    <img src="{{url('assets/img/faces/face-2.jpg')}}" />
	                </div>
	                <div class="info">
	                    <a data-toggle="collapse" href="#collapseExample" class="collapsed">
	                        Chet Faker
	                        <b class="caret"></b>
	                    </a>
	                    <div class="collapse" id="collapseExample">
	                        <ul class="nav">
	                            <li><a href="#profile">My Profile</a></li>
	                            <li><a href="#editprofile">Edit Profile</a></li>
	                            <li><a href="#settings">Settings</a></li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	            <ul class="nav">
	                <li class="active">
	                    <a href="{{url('dashboard/')}}">
	                        <i class="fa fa-dashboard"></i>
	                        <p>Dashboard
                            </p>
	                    </a>
	                </li>
	                <li class="">
	                    <a href="{{url('dashboard/')}}">
	                        <i class="fa fa-comments-o"></i>
	                        <p>Send Message
                            </p>
	                    </a>
	                </li>
	                <li class="">
	                    <a href="{{url('dashboard/')}}">
	                        <i class="fa fa-history"></i>
	                        <p>Messages List
                            </p>
	                    </a>
	                </li>
	                <li class="">
	                    <a href="{{url('dashboard/')}}">
	                        <i class="fa fa-power-off"></i>
	                        <p>Sign Out
                            </p>
	                    </a>
	                </li>
					
	            </ul>
	    	</div>
	    </div>

	    <div class="main-panel">
			<nav class="navbar navbar-default">
	            <div class="container-fluid">
					<div class="navbar-minimize">
						<button id="minimizeSidebar" class="btn btn-fill btn-icon"><i class="fa fa-dot-circle-o"></i></button>
					</div>
	                <div class="navbar-header">
	                    <button type="button" class="navbar-toggle">
	                        <span class="sr-only">Toggle navigation</span>
	                        <span class="icon-bar bar1"></span>
	                        <span class="icon-bar bar2"></span>
	                        <span class="icon-bar bar3"></span>
	                    </button>
	                    <a class="navbar-brand" href="#Dashboard">
							Overview
						</a>
	                </div>
	                <div class="collapse navbar-collapse">

						<form class="navbar-form navbar-left navbar-search-form" role="search">
	    					<div class="input-group">
	    						<span class="input-group-addon"><i class="fa fa-search"></i></span>
	    						<input type="text" value="" class="form-control" placeholder="Search...">
	    					</div>
	    				</form>

	                    <ul class="nav navbar-nav navbar-right">
	                        
	                        <li class="dropdown">
	                            <a href="#notifications" class="dropdown-toggle" data-toggle="dropdown">
	                                <i class="fa fa-bell"></i>
	                                <span class="notification">5</span>
									<p class="hidden-md hidden-lg">
										Notifications
										<b class="caret"></b>
									</p>
	                            </a>
	                            <ul class="dropdown-menu">
	                                <li><a href="#not1">Notification 1</a></li>
	                                <li><a href="#not2">Notification 2</a></li>
	                                <li><a href="#not3">Notification 3</a></li>
	                                <li><a href="#not4">Notification 4</a></li>
	                                <li><a href="#another">Another notification</a></li>
	                            </ul>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	        </nav>


<div class="content">
    <div class="container-fluid">
        <div class="row">
{% block content %}{% endblock %}

</div>
                </div>
	        </div>



{{ this.assets.outputJs('footers') }}
<script>
    
  </script>
</body>
</html>