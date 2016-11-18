{% extends "templates/base.volt" %}

{% block head %}{% endblock %}

{% block content %}
<!-- Panel Basic -->
      <div class="panel">
        <div class="panel-heading">
            <h3 class="panel-title"><strong>Order Now</strong><span class="panel-desc">Panel Description Here..</span>
            
            </h3>
            <button type="button" class="btn btn-primary dropdown-toggle btn-lg"
                    id="exampleSizingDropdown1" data-toggle="dropdown" aria-expanded="false">
                      <small><span id="cart_id">({{total_order}})</span> <i class="icon wb-bell" aria-hidden="true"></i></small>
                      <span class="caret"></span>
                    </button>
            <ul class="dropdown-menu dropdown-menu-primary"  style="width:350px; padding:20px" id="exampleSplitDropdown1" aria-labelledby="exampleSplitDropdown1" role="menu">
              
            </ul>
          <div class="panel-actions">
            <a href="{{url('backend/order/baskets')}}" class="btn btn-lg btn-default"><small>View Basket</small></a><a href="" class="btn btn-lg btn-danger"><small>Empty Basket</small></a>
            
          
        </div>

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
                <th>Title</th>
                <th>Category</th>
                <th>Shop(s)</th>
                <th>Location</th>
                <th>Sales Price</th>
                <th>Image(s)</th>
                <th>Action(s)</th>
              </tr>
            </tfoot>
            
          </table>
        </div>
      </div>
      <!-- End Panel Basic -->
{% endblock %}
