{% extends "templates/base.volt" %}

{% block head %}{% endblock %}

{% block content %}
<div class="panel">
        <header class="panel-heading">
          <div class="panel-actions"></div>
          <h3 class="panel-title">View Customers</strong> </h3>
        </header>
        <div class="panel-body">
          <table class="table table-hover dataTable table-striped width-full" data-plugin="dataTable" id="customerView">
            <thead>
              <tr>
                <th>First Name(s)</th>
                <th>Last Name(s)</th>
                <th>Email</th>
                <th>Phone(s)</th>
                <th>Address(es)</th>
                <th>Action(s)</th>
              </tr>
            </thead>
            <tfoot>
              <tr>
                <th>First Name(s)</th>
                <th>Last Name(s)</th>
                <th>Email</th>
                <th>Phone(s)</th>
                <th>Address(es)</th>
                <th>Action(s)</th>
              </tr>
            </tfoot>
            
          </table>
        </div>
      </div>
      <!-- End Panel Basic -->
{% endblock %}