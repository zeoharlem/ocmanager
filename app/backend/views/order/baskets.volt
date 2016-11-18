{% extends "templates/base.volt" %}

{% block head %}
<style>
a.btn{
    text-decoration: none !important;
}
</style>
{% endblock %}

{% block content %}
<!-- Panel -->
      <div class="panel">
        <div class="panel-body container-fluid">
          <div class="row row-lg">
            <div class="col-md-12">
              <!-- Example Basic -->
              <div class="example-wrap">
                <h4 class="example-title">View Cart</h4>
                <p>Products Stored in the Basket.</p>
                <div class="table-responsive">
                <form method="post" id="basketView">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>Invoice</th>
                          <th>User</th>
                          <th>Date</th>
                          <th>Amount</th>
                          <th>Status</th>
                          <th>Country</th>
                        </tr>
                      </thead>
                      <tbody>
                      <?php $total = array(); ?>
                      {% for keys, values in session.get('cart_item') %}
                        <tr>
                          <td><a href="javascript:void(0)">{{keys}}</a></td>
                          <td>{{values['name'] | capitalize}}</td>
                          <td>
                            <span class="text-muted">{{values['price']}}</span>
                          </td>
                          <td><input type="text" class="form-control qty_pack" style="width:10%" value="{{values['qty']}}" /></td>
                          <td>
                            <div class="text-muted"><?php $totalAmount = $values['price']*$values['qty']; echo $totalAmount; $total[] = $totalAmount; ?></div>
                          </td>
                          <td><a href="javascript:void(0);" class="btn btn-default btn-sm delete_product" title="{{keys}}">Delete</a></td>
                        </tr>
                        {% endfor %}
                        <tr>
                          <td></td>
                          <td><button class="btn btn-primary updateTotal" type="button">Update</button>&nbsp;<button class="btn btn-danger">Clear</button></td>
                          <td>

                          </td>
                          <td><strong>Total Amount</strong></td>
                          <td>
                          <?php echo array_sum($total); ?>
                          </td>
                          <td></td>
                        </tr>
                      </tbody>
                    </table>
                </form>
              </div>
              <a href="{{url('backend/order/getCustomers')}}" class="btn btn-primary">Proceed To Order</a>
              </div>
              <!-- End Example Basic -->
            </div>
</div>
</div>
</div>
{% endblock %}
