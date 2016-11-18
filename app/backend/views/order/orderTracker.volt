{% extends "templates/base.volt" %}

{% block head %}{% endblock %}

{% block content %}
<!-- Panel Basic -->
      <div class="panel">
        <div class="panel-heading">
            <h3 class="panel-title"><strong>Order | Job Tracker</strong><span class="panel-desc">Panel Description Here..</span></h3>

        </div>
        <p>&nbsp;</p>
        <div class="panel-body">
          <table class="table table-hover dataTable table-striped width-full" data-plugin="dataTable" id="orderTracker">
            <thead>
              <tr>
                <th>Job ID</th>
                <th>Trans ID</th>
                <th>Hash(s)</th>
                <th>Name</th>
                <th>Address</th>
                <th>Tracker</th>
                <th>Job Token(s)</th>
                <th>Action(s)</th>
              </tr>
            </thead>
            <tfoot>
              <tr>
                <th>Job ID</th>
                <th>Trans ID</th>
                <th>Hash(s)</th>
                <th>Name</th>
                <th>Address</th>
                <th>Tracker</th>
                <th>Job Token(s)</th>
                <th>Action(s)</th>
              </tr>
            </tfoot>
            
          </table>
        </div>
      </div>
      <!-- End Panel Basic -->
{% endblock %}
