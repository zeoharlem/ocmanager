{% extends "templates/base.volt" %}

{% block head %}
<style>
.example-modal-sidebar .center {
    top: 0;
    right: 5px;
    left: auto;
    -webkit-transform: none;
    -ms-transform: none;
    -o-transform: none;
    transform: none;
  }

.modal-sidebar{
    width:500px;
}
</style>
{% endblock %}

{% block content %}
<div class="panel">
        <header class="panel-heading">
          <div class="panel-actions"></div>
          <h3 class="panel-title"><strong>JOB TASK</strong></h3>
        </header>
        <div class="panel-body">
          <div class="alert alert-success alert-lg">Job ID #{{job_id}} as been created successfully. <strong>Monitor <a href="{{tr}}" target="_blank">from here</a></strong></div>
        </div>
</div>
{% endblock %}