{% extends "templates/base.volt" %}

{% block head %}

{% endblock %}

{% block content %}

            <div class="col-md-6 masonry-item">
          <!-- Panel Followers -->
          <div class="panel" id="followers">
            <div class="panel-heading">
              <h3 class="panel-title">
                <i class="icon wb-check" aria-hidden="true"></i> <strong>Agent List</strong>
              </h3>
            </div>
            <div class="panel-body">
            
              <ul class="list-group list-group-dividered list-group-full">
              <?php $counter=1; ?>
              {% for keys, values in agents['team'].data %}
                <li class="list-group-item">
                  <div class="media">
                    <div class="media-left">
                      <a class="avatar avatar-online" href="javascript:void(0)">
                        <img src="{{url('admin/portraits/'~counter~'.jpg')}}" alt="">
                        <i></i>
                      </a>
                    </div>
                    <div class="media-body">
                      <div class="pull-right">
                        <button type="button" data-title="{{values.username}}" data-agent="{{values.fleet_id}}" class="btn btn-outline btn-default btn-lg sweetAlertReply"><small>Assign Task</small></button>
                      </div>
                      <div><strong>{{values.username | capitalize}}</strong></div>
                      <small>{{values.phone}}</small>
                    </div>
                  </div>
                </li>
                <?php $counter++; ?>
               {% endfor %}
              </ul>
            </div>
          </div>
          <!-- End Panel Followers -->
        </div>

            <div class="col-md-6 masonry-item">
          <!-- Panel Followers -->
          <div class="panel" id="followers">
            <div class="panel-heading">
              <h3 class="panel-title">
                <i class="icon wb-check" aria-hidden="true"></i> <strong>Order Cart</strong>
              </h3>
            </div>
            <div class="panel-body">
            <!-- Example Basic Form -->
              <div class="example-wrap">
                <div class="example">
                  <form autocomplete="off" id="postOrderNow" method="post">
                    <div class="form-group row">
                      <div class="col-sm-6">
                        <label class="control-label" for="inputBasicFirstName">First Name</label>
                        <input type="text" class="form-control" id="inputBasicFirstName" name="firstname"
                        placeholder="First Name" autocomplete="off" value="{{customer.firstname}}" />
                      </div>
                      <div class="col-sm-6">
                        <label class="control-label" for="inputBasicLastName">Last Name</label>
                        <input type="text" class="form-control" id="inputBasicLastName" name="lastname"
                        placeholder="Last Name" autocomplete="off" value="{{customer.lastname}}" />
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label" for="inputBasicEmail">Email Address</label>
                      <input type="email" class="form-control" id="inputBasicEmail" name="email"
                      placeholder="Email Address" autocomplete="off" value="{{customer.email}}" />
                    </div>

                    <div class="form-group">
                      <label class="control-label" for="inputBasicAddress">Delivery Address</label>
                      <textarea class="form-control" name="address">{{customer.address}}</textarea>
                    </div>

                    <div class="form-group">
                      <label class="control-label" for="inputBasicEmail">Phone Number</label>
                      <input type="text" class="form-control" id="inputBasicEmail" name="phonenumber"
                      placeholder="Phone Number" autocomplete="off" value="{{customer.phonenumber}}" />
                      <input type="hidden" name="trans_id" value="<?php echo $this->component->helper->makeRandomInts(10); ?>" />
                      <input type="hidden" name="fleet_id" value="" />
                    </div>
                    <div class="form-group">
                        <ul class="list-group list-group-full hide" id="agent_stack">
                            <li class="list-group-item">
                              <div class="media">
                                <div class="media-left">
                                  <a class="avatar avatar-online" href="javascript:void(0)">
                                    <img class="img-responsive" src="{{url('admin/portraits/5.jpg')}}"
                                    alt="..."><i></i></a>
                                </div>
                                <div class="media-body">
                                  <h4 class="media-heading" id="agent_name">Agents</h4>
                                  <p>Peppered Rice Agent.</p>
                                </div>
                              </div>
                            </li>
                        </ul>
                    </div>
                    <div class="form-group">
                      <button type="button" class="btn btn-primary btn-lg" id="orderNow"><small>Order Now</small></button>
                    </div>
                  </form>
                </div>
              </div>
              <!-- End Example Basic Form -->
            </div>
          </div>
          <!-- End Panel Followers -->
        </div>
{% endblock %}
