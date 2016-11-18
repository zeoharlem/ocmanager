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
                    <select name="cities" class="selectpicker" data-title="Select Category" data-style="btn-primary btn-block" data-menu-style="dropdown-blue">
                                                <option value="id">Bahasa Indonesia</option>
                                                <option value="ms">Bahasa Melayu</option>
                                                <option value="ca">Català</option>
                                                <option value="da">Dansk</option>
                                                <option value="de">Deutsch</option>
                                                <option value="en">English</option>
                                                <option value="es">Español</option>
                                                <option value="el">Eλληνικά</option>
                                                <option value="fr">Français</option>
                                                <option value="it">Italiano</option>
                                                <option value="hu">Magyar</option>
                                                <option value="nl">Nederlands</option>
                                                <option value="no">Norsk</option>
                                                <option value="pl">Polski</option>
                                                <option value="pt">Português</option>
                                                <option value="fi">Suomi</option>
                                                <option value="sv">Svenska</option>
                                                <option value="tr">Türkçe</option>
                                                <option value="is">Íslenska</option>
                                            </select>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" placeholder="Password" class="form-control">
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
