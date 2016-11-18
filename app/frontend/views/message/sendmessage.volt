{% extends "templates/base.volt" %}

{% block head %}

{% endblock %}
{% block content %}

<div class="col-md-8">
    <div class="card">
                                <form method="#" action="#">
                <div class="header">
                                                <h4 class="title">
                                                            Send Message Now
                                                    </h4>
                                            </div>
                <div class="content">
                <div class="form-group">
                    <label>Email address</label>
                    <input type="email" placeholder="Enter email" class="form-control">
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" placeholder="Password" class="form-control">
                </div>
                <div class="form-group">
                    <label class="checkbox">
                        <input type="checkbox" data-toggle="checkbox" value="" checked>
                        Subscribe to newsletter
                    </label>
                </div>
                <button type="submit" class="btn btn-fill btn-info">Submit</button>
                </div>
                                </form>
    </div> <!-- end card -->
</div> <!--  end col-md-6  -->
{% endblock %}
