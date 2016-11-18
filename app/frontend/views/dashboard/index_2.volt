
{% block content %}
<!-- ========================================= CONTENT ========================================= -->

<section id="checkout-page">
    <div class="container">
        <div class="col-xs-12 no-margin">
            
            <div class="billing-address">
                <h2 class="border h1">billing address</h2>
                <form method="post" action="{{url('order/start')}}" id="billing-form">
                    <div class="row field-row">
                        <div class="col-xs-12 col-sm-6">
                            <label>full name*</label>
                            <input class="le-input" name="firstname" value="{{session.get('auth')['firstname']}}" >
                        </div>
                        <div class="col-xs-12 col-sm-6">
                            <label>last name*</label>
                            <input class="le-input" name="lastname"  value="{{session.get('auth')['lastname']}}" />
                        </div>
                    </div><!-- /.field-row -->

                    <div class="row field-row">
                        <div class="col-xs-12">
                            <label>company name</label>
                            <input class="le-input" name="company" type="text" >
                            <input type="hidden" name="date_of_order" value="<?php echo date('Y-m-d H:i:s'); ?>" />
                            <input type="hidden" name="trans_id" value="{{trans_id}}" />
                        </div>
                    </div><!-- /.field-row -->

                    <div class="row field-row">
                        <div class="col-xs-12 col-sm-6">
                            <label>address*</label>
                            <input class="le-input" data-placeholder="street address" name="address" required />
                        </div>
                        <div class="col-xs-12 col-sm-3">
                            <label>&nbsp;</label>
                            <input class="le-input" data-placeholder="State" name="state">
                        </div>
                        <div class="col-xs-12 col-sm-3">
                            <label>&nbsp;</label>
                            <input class="le-input" data-placeholder="town" name="city">
                        </div>
                    </div><!-- /.field-row -->
                    
                    <div class="row field-row">
                        <div class="col-xs-12">
                            <label>Additional Information</label>
                            <textarea class="le-input" name="additional_info" type="text" ></textarea>
                            
                        </div>
                    </div><!-- /.field-row -->
                    
                    <div class="row field-row">
                        <div class="col-xs-12 col-sm-4">
                            <label>postcode / Zip*</label>
                            <input class="le-input" name="postzip" type="text" / >
                        </div>
                        <div class="col-xs-12 col-sm-4">
                            <label>email address*</label>
                            <input class="le-input" name="email" value="{{session.get('auth')['email']}}" / >
                        </div>

                        <div class="col-xs-12 col-sm-4">
                            <label>phone number*</label>
                            <input class="le-input" name="phonenumber" value="{{session.get('auth')['phonenumber']}}">
                        </div>
                    </div><!-- /.field-row -->

                    <div class="row field-row">
                        <div id="create-account" class="col-xs-12">
                            <input  class="le-checkbox big" type="checkbox"  />
                            <a class="simple-link bold" href="#">Are you sure?</a> - Be sure than to be sorry.
                        </div>
                    </div><!-- /.field-row -->

                </form>
            </div><!-- /.billing-address -->


            <section id="your-order">
                <h2 class="border h1">your order</h2>
                <form>
                    {% for keys, values in cart_item %}
                    <div class="row no-margin order-item">
                        <div class="col-xs-12 col-sm-1 no-margin">
                            <a href="#" class="qty">{{values['qty']}} x</a>
                        </div>

                        <div class="col-xs-12 col-sm-9 ">
                            <div class="title"><a href="#">{{values['name']}}</a> <small> (${{values['price']}}.00)</small></div>
                            <div class="brand">peppered rice</div>
                        </div>

                        <div class="col-xs-12 col-sm-2 no-margin">
                            <div class="price">${{values['price']*values['qty']}}.00</div>
                        </div>
                    </div><!-- /.order-item -->
                    {% endfor %}
                </form>
            </section><!-- /#your-order -->

            <div id="total-area" class="row no-margin">
                <div class="col-xs-12 col-lg-4 col-lg-offset-8 no-margin-right">
                    <div id="subtotal-holder">

                        <ul id="total-field" class="tabled-data inverse-bold ">
                            <li>
                                <label>order total</label>
                                <div class="value">${{grandTotal}}.00</div>
                            </li>
                        </ul><!-- /.tabled-data -->

                    </div><!-- /#subtotal-holder -->
                </div><!-- /.col -->
            </div><!-- /#total-area -->

            <div id="payment-method-options">
                <form>
                    <div class="payment-method-option">
                        <input class="le-radio" type="radio" name="group2" value="Direct">
                        <div class="radio-label bold ">Direct Bank Transfer<br>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce rutrum tempus elit, vestibulum vestibulum erat ornare id.</p>
                        </div>
                    </div><!-- /.payment-method-option -->
                    
                    <div class="payment-method-option">
                        <input class="le-radio" type="radio" name="group2" value="cheque">
                        <div class="radio-label bold ">cheque payment</div>
                    </div><!-- /.payment-method-option -->
                    
                    <div class="payment-method-option">
                        <input class="le-radio" type="radio" name="group2" value="paypal">
                        <div class="radio-label bold ">paypal system</div>
                    </div><!-- /.payment-method-option -->
                </form>
            </div><!-- /#payment-method-options -->
            
            <div class="place-order-button">
                <button class="le-button big" id="place-order" type="button">place order</button>
            </div><!-- /.place-order-button -->

        </div><!-- /.col -->
    </div><!-- /.container -->    
</section><!-- /#checkout-page -->
<!-- ========================================= CONTENT : END ========================================= -->		
{% endblock %}