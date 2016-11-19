{% extends "templates/base.volt" %}

{% block head %}

{% endblock %}
{% block content %}
<div class="col-md-12">
	                        <div class="card">
	                            <div class="content">
	                                <div class="toolbar">
	                                    <!--Here you can write extra buttons/actions for the toolbar-->
	                                </div>
	                                <table id="bootstrap-table" class="table">
	                                    <thead>
	                                        <th data-field="state" data-checkbox="true"></th>
	                                        <th data-field="id" class="text-center">ID</th>
	                                    	<th data-field="name" data-sortable="true">Name</th>
	                                    	<th data-field="salary" data-sortable="true">Salary</th>
	                                    	<th data-field="country" data-sortable="true">Country</th>
	                                    	<th data-field="city">City</th>
	                                    	<th data-field="actions" class="td-actions text-right" data-events="operateEvents" data-formatter="operateFormatter">Actions</th>
	                                    </thead>
	                                    <tbody>
                                            {% for keys,values in messages %}
	                                        <tr>
	                                            <td></td>
	                                        	<td>{{values.message_id}}</td>
	                                        	<td>{{values.title | capitalize}}</td>
	                                        	<td>{{values.getMsgcat().category_name | upper}}</td>
	                                        	<td>{{values.date_reg}}</td>
	                                        	<td>{{values.city}}</td>
	                                        	<td></td>
	                                        </tr>
	                                    {% endfor %}    
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div><!--  end card  -->
	                    </div> <!-- end col-md-12 -->
{% endblock %}