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
                                                    <p>
                                                    {{flash.output()}}
                                                    </p>
                                            </div>
                <div class="content">
                <div class="form-group">
                    <label>Title of Message</label>
                    <input type="text" placeholder="Type your Message Title" class="form-control">
                </div>
                <div class="form-group">
                <label>Category</label>
                    <select name="cities" class="selectpicker" data-title="Select Category" data-style="btn-primary btn-block" data-menu-style="dropdown-blue">
                                                <option value="id">Bahasa Indonesia</option>
                                                <option value="ms">Bahasa Melayu</option>
                                                <option value="ca">Català</option>
                                                <option value="da">Dansk</option>
                                                <option value="de">Deutsch</option>
                                            </select>
                </div>
                
                <div class="form-group">
                    <label>
                        Subscribe to newsletter</label>
                        <textarea class="form-control"></textarea>
                    </label>
                </div>
                <button type="submit" class="btn btn-fill btn-info">Submit</button>
                </div>
                                </form>
    </div> <!-- end card -->
</div> <!--  end col-md-6  -->
{% endblock %}
