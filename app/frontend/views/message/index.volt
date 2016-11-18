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
	                                        <tr>
	                                            <td></td>
	                                        	<td>1</td>
	                                        	<td>Dakota Rice</td>
	                                        	<td>$36,738</td>
	                                        	<td>Niger</td>
	                                        	<td>Oud-Turnhout</td>
	                                        	<td></td>
	                                        </tr>
	                                        <tr>
	                                            <td></td>
	                                        	<td>2</td>
	                                        	<td>Minerva Hooper</td>
	                                        	<td>$23,789</td>
	                                        	<td>Curaçao</td>
	                                        	<td>Sinaai-Waas</td>
	                                        	<td></td>
	                                        </tr>
	                                        <tr>
	                                            <td></td>
	                                        	<td>3</td>
	                                        	<td>Sage Rodriguez</td>
	                                        	<td>$56,142</td>
	                                        	<td>Netherlands</td>
	                                        	<td>Baileux</td>
	                                        	<td></td>
	                                        </tr>
	                                        <tr>
	                                            <td></td>
	                                        	<td>4</td>
	                                        	<td>Philip Chaney</td>
	                                        	<td>$38,735</td>
	                                        	<td>Korea, South</td>
	                                        	<td>Overland Park</td>
	                                        	<td></td>
	                                        </tr>
	                                        <tr>
	                                            <td></td>
	                                        	<td>5</td>
	                                        	<td>Doris Greene</td>
	                                        	<td>$63,542</td>
	                                        	<td>Malawi</td>
	                                        	<td>Feldkirchen in Kärnten</td>
	                                        	<td></td>
	                                        </tr>
	                                        <tr>
	                                            <td></td>
	                                        	<td>6</td>
	                                        	<td>Mason Porter</td>
	                                        	<td>$78,615</td>
	                                        	<td>Chile</td>
	                                        	<td>Gloucester</td>
	                                        	<td></td>
	                                        </tr>
	                                        <tr>
	                                            <td></td>
	                                        	<td>7</td>
	                                        	<td>Alden Chen</td>
	                                        	<td>$63,929</td>
	                                        	<td>Finland</td>
	                                        	<td>Gary</td>
	                                        	<td></td>
	                                        </tr>
	                                        <tr>
	                                            <td></td>
	                                        	<td>8</td>
	                                        	<td>Colton Hodges</td>
	                                        	<td>$93,961</td>
	                                        	<td>Nicaragua</td>
	                                        	<td>Delft</td>
	                                        	<td></td>
	                                        </tr>
	                                        <tr>
	                                            <td></td>
	                                        	<td>9</td>
	                                        	<td>Illana Nelson</td>
	                                        	<td>$56,142</td>
	                                        	<td>Heard Island</td>
	                                        	<td>Montone</td>
	                                        	<td></td>
	                                        </tr>
	                                        <tr>
	                                            <td></td>
	                                        	<td>10</td>
	                                        	<td>Nicole Lane</td>
	                                        	<td>$93,148</td>
	                                        	<td>Cayman Islands</td>
	                                        	<td>Cottbus</td>
	                                        	<td></td>
	                                        </tr>
	                                        
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div><!--  end card  -->
	                    </div> <!-- end col-md-12 -->
{% endblock %}