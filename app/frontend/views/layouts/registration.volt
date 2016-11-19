<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Online Complain Registration</title>

	{{ this.assets.outputCss('headers') }}
            
        {% block head %} {% endblock %}

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
</head>
<body>
<nav class="navbar navbar-transparent navbar-absolute">
	    <div class="container">
	        <div class="navbar-header">
	            <button type="button" class="navbar-toggle navbar-toggle-black" data-toggle="collapse" data-target="#navigation-example-2">
	                <span class="sr-only">Toggle navigation</span>
	                <span class="icon-bar "></span>
	                <span class="icon-bar "></span>
	                <span class="icon-bar"></span>
	            </button>
	        </div>
	        <div class="collapse navbar-collapse">
	            <ul class="nav navbar-nav navbar-right">
	                <li>
	                   <a href="{{url('index/')}}" class="btn">
	                        Looking to login?
	                    </a>
	                </li>
	            </ul>
	        </div>
	    </div>
	</nav>

	<div class="wrapper wrapper-full-page">
    	<div class="register-page">
		<!--   you can change the color of the filter page using: data-color="blue | azure | green | orange | red | purple" -->
        	<div class="content">
            	<div class="container">
                	<div class="row">
                    	<div class="col-md-8 col-md-offset-2">
                        	<div class="header-text">
                            	<h2>Online Complain Management</h2>
                            	<h4>Register for free today.</h4>
                            	<hr>
                        	</div>
                    	</div>
                    	<div class="col-md-4 col-md-offset-2">
                        	<div class="media">
                            	<div class="media-left">
                                	<div class="icon icon-danger">
                                    	<i class="fa fa-user"></i>
                                	</div>
                            	</div>
                            	<div class="media-body">
                                	<h5>Online Complain Management</h5>
                                	Register for free to have access to our services.
                            	</div>
                        	</div>
                        	<div class="media">
                            	<div class="media-left">
                                	<div class="icon icon-warning">
                                    	<i class="fa fa-envelope"></i>
                                	</div>
                            	</div>
                            	<div class="media-body">
                                	<h5>Awesome Performances</h5>
                                	Our response is fast and healthy. 
                            	</div>
                        	</div>
                        	<div class="media">
                            	<div class="media-left">
                                	<div class="icon icon-info">
                                    	<i class="fa fa-phone"></i>
                                	</div>
                            	</div>
                            	<div class="media-body">
                                	<h5>Global Support</h5>
                                	We provide global support for our clients. 
                            	</div>
                        	</div>
                    	</div>
                    	<div class="col-md-4">
                                {{flash.output()}}
                        	<form method="post" action="{{url('register/')}}">
                            	<div class="card card-plain">
                                	<div class="content">
                                    	<div class="form-group">
                                        	<input type="text" placeholder="Your First Name" class="form-control">
                                    	</div>
                                    	<div class="form-group">
                                        	<input type="text" placeholder="Your Last Name" class="form-control">
                                    	</div>
                                    	<div class="form-group">
                                        	<input type="text" placeholder="Company" class="form-control">
                                    	</div>
                                    	<div class="form-group">
                                        	<input type="text" placeholder="phonenumber" class="form-control">
                                    	</div>
                                    	<div class="form-group">
                                        	<textarea name="address" class="form-control" placeholder="Address"></textarea>
                                    	</div>
                                    	<div class="form-group">
                                        	<input type="email" placeholder="Enter email" class="form-control">
                                    	</div>
                                    	
                                    	<div class="form-group">
                                        	<input type="password" placeholder="Password Confirmation" class="form-control">
                                    	</div>
                                	</div>
                                	<div class="footer text-center">
                                    	<button type="submit" class="btn btn-fill btn-danger btn-wd">Create Free Account</button>
                                	</div>
                            	</div>
                        	</form>
                    	</div>
                	</div>
            	</div>
        	</div>

    		<footer class="footer footer-transparent">
            	<div class="container">
                	<div class="copyright text-center">
                    	&copy; <script>document.write(new Date().getFullYear())</script>
                	</div>
            	</div>
        	</footer>
		</div>
	</div>

{{ this.assets.outputJs('footers') }}
</body>
</html>