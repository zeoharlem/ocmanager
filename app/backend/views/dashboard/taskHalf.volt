
{% block content %}
<!-- ========================================= CONTENT ========================================= -->

<section id="checkout-page">
    <div class="container">
        <div class="alert alert-success"><strong>{{query['customer_name'] | capitalize}}</strong><p>{{query['customer_address'] | capitalize}}</p>, <a href="{{query['tracking_link']}}" target="_blank" class="btn btn-danger"><small>Track Now</small></a></div>
    </div><!-- /.container -->    
</section><!-- /#checkout-page -->
<!-- ========================================= CONTENT : END ========================================= -->		
{% endblock %}