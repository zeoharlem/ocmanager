
{% block content %}
<!-- ========================================= CONTENT ========================================= -->
<div class="col-md-12">
	                        <div class="card">
	                            <div class="header">
	                                <h4 class="title">Tabs</h4>
	                                <p class="category">Plain text tabs</p>
	                            </div>
	                            <div class="content">
	                                <div class="nav-tabs-navigation">
				                        <div class="nav-tabs-wrapper">
					                        <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
					                            <li class="active"><a href="#home" data-toggle="tab">Home</a></li>
					                            <li><a href="#profile" data-toggle="tab">Profile</a></li>
					                            <li><a href="#messages" data-toggle="tab">Messages</a></li>
					                        </ul>
				                        </div>
				                    </div>
				                    <div id="my-tab-content" class="tab-content text-center">
				                        <div class="tab-pane active" id="home">
				                            <p>Larger, yet dramatically thinner. More powerful, but remarkably power efficient. With a smooth metal surface that seamlessly meets the new Retina HD display.</p>
				                        </div>
				                        <div class="tab-pane" id="profile">
				                            <p>Here is your profile.</p>
				                        </div>
				                        <div class="tab-pane" id="messages">
				                            <p>Here are your messages.</p>
				                        </div>
				                    </div>
	                            </div>
	                        </div>
	                    </div>	
{% endblock %}