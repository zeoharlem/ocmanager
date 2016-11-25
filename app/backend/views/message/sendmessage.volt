{% extends "templates/base.volt" %}

{% block head %}

{% endblock %}
{% block content %}

<div class="col-md-8">
    <div class="card">
                                <form method="post" action="{{url('message/sendmessage')}}">
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
                    <input type="text" placeholder="Type your Message Title" name="title" class="form-control">
                </div>
                <div class="form-group">
                <label>Category</label>
                    <select name="category_id" class="selectpicker" data-title="Select Category" data-style="btn-primary btn-block" data-menu-style="dropdown-blue">
                                                {% for keys,values in category %}
                                                    <option value="{{values.category_id}}">{{values.category_name}}</option>
                                                {% endfor %}
                                            </select>
                </div>

                <div class="form-group">
                <label>State</label>
                    <select name="city" class="selectpicker" data-title="Select State/Region" data-style="btn-primary btn-block" data-menu-style="dropdown-blue">
                        <option value="Abuja FCT">Abuja FCT</option>
                        <option value="Abia">Abia</option>
                        <option value="Adamawa">Adamawa</option>
                        <option value="Akwa Ibom">Akwa Ibom</option>
                        <option value="Anambra">Anambra</option>
                        <option value="Bauchi">Bauchi</option>
                        <option value="Bayelsa">Bayelsa</option>
                        <option value="Benue">Benue</option>
                        <option value="Borno">Borno</option>
                        <option value="Cross River">Cross River</option>
                        <option value="Delta">Delta</option>
                        <option value="Ebonyi">Ebonyi</option>
                        <option value="Edo">Edo</option>
                        <option value="Ekiti">Ekiti</option>
                        <option value="Enugu">Enugu</option>
                        <option value="Gombe">Gombe</option>
                        <option value="Imo">Imo</option>
                        <option value="Jigawa">Jigawa</option>
                        <option value="Kaduna">Kaduna</option>
                        <option value="Kano">Kano</option>
                        <option value="Katsina">Katsina</option>
                        <option value="Kebbi">Kebbi</option>
                        <option value="Kogi">Kogi</option>
                        <option value="Kwara">Kwara</option>
                        <option value="Lagos">Lagos</option>
                        <option value="Nassarawa">Nassarawa</option>
                        <option value="Niger">Niger</option>
                        <option value="Ogun">Ogun</option>
                        <option value="Ondo">Ondo</option>
                        <option value="Osun">Osun</option>
                        <option value="Oyo">Oyo</option>
                        <option value="Plateau">Plateau</option>
                        <option value="Rivers">Rivers</option>
                        <option value="Sokoto">Sokoto</option>
                        <option value="Taraba">Taraba</option>
                        <option value="Yobe">Yobe</option>
                        <option value="Zamfara">Zamfara</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label>
                        Message Description</label>
                        <textarea class="form-control" name="description"></textarea>
                    </label>
                </div>
                <button type="submit" class="btn btn-fill btn-info">Submit</button>
                </div>
                                </form>
    </div> <!-- end card -->
</div> <!--  end col-md-6  -->
{% endblock %}
