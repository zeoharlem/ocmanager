<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of OrderController
 *
 * @author Theophilus Alamu <theophilus.alamu at gmail.com>
 */
namespace Multiple\Backend\Controllers;

class OrderController extends BaseController{
    //put your code here
    private $_track;
    //const ACESS_TOKEN = 'e824c4f685bca92ed63ffd522a855f52';
    const ACESS_TOKEN = 'df6bb34d1342938032946e88cce350dcce17d58c2267a0c74474b933be45823a';
    const PARAMETER_MISSING = 100, ACTION_COMPLETE = 200, SHOW_ERROR_MESSAGE = 201;
    const INVALID_ACCESS_TOKEN = 101, ERROR_IN_EXECUTION = 404;
    
    public function initialize() {
        parent::initialize();
        \Phalcon\Tag::appendTitle('Order');
        $this->assets->collection('headers')->addCss(
                'admin/vendor/datatables-bootstrap/dataTables.bootstrap.css')
                ->addCss('admin/vendor/datatables-fixedheader/dataTables.fixedHeader.css')
                ->addCss('admin/vendor/datatables-responsive/dataTables.responsive.css');
        $this->assets->collection('footers')->addJs(
                'admin/vendor/datatables/jquery.dataTables.min.js')
                ->addJs('admin/vendor/datatables-fixedheader/dataTables.fixedHeader.js')
                ->addJs('admin/vendor/datatables-bootstrap/dataTables.bootstrap.js')
                ->addJs('admin/vendor/datatables-responsive/dataTables.responsive.js')
                ->addJs('admin/vendor/datatables-tabletools/dataTables.tableTools.js')
                ->addJs('admin/js/components/bootbox.min.js')
                ->addJs('admin/js/customapp.js');
    }
    
    public function indexAction() {
        $config = array(
            "host"  => "localhost",
            "user"  => "root",
            "pass"  => "",
            "db"    => "pepperedrice"
        );
        $response   = new \Phalcon\Http\Response();
        $primaryKey = 'order_id'; $table = 'order';
        if($this->request->isGet() && $this->request->isAjax()){
            $columns    = array(
                array('db' => 'firstname', 'dt' => 0),
                array('db' => 'lastname', 'dt' => 1),
                array('db' => 'email', 'dt' => 2),
                array('db' => 'phonenumber', 'dt' => 3),
                array('db' => 'address', 'dt' => 4),
                array('db' => 'trans_id', 'dt' => 5),
                array('db' => 'date_of_order', 'dt' => 6),
                array('db' => 'order_id', 'dt' => 7),
            );
            $response->setJsonContent(
                    \Multiple\Backend\Plugins\SspPlugin::simple(
                            $_GET, $config, $table, $primaryKey, $columns));
            $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
            $response->setHeader('Content-Type', 'application/json');
            $response->send();
            exit();
        }
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
        return;
    }
    
    public function showAction(){
        $this->view->setVars(array(
            'total_order'   => count($this->session->get('cart_item'))));
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
        return;
    }
    
    public function getCustomersAction(){
        $config = array(
            "host"  => "localhost",
            "user"  => "root",
            "pass"  => "",
            "db"    => "pepperedrice"
        );
        $response   = new \Phalcon\Http\Response();
        $primaryKey = 'register_id'; $table = 'register';
        if($this->request->isGet() && $this->request->isAjax()){
            $columns    = array(
                array('db' => 'firstname', 'dt' => 0),
                array('db' => 'lastname', 'dt' => 1),
                array('db' => 'email', 'dt' => 2),
                array('db' => 'phonenumber', 'dt' => 3),
                array('db' => 'address', 'dt' => 4),
                array('db' => 'register_id', 'dt' => 5),
            );
            $response->setJsonContent(
                    \Multiple\Backend\Plugins\SspPlugin::simple(
                            $_GET, $config, $table, $primaryKey, $columns));
            $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
            $response->setHeader('Content-Type', 'application/json');
            $response->send();
            exit();
        }
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
        return;
    }
    
    /**
     * 
     * @return typeCounte the number of items added
     */
    public function totalItemAction() {
        echo count($this->session->get('cart_item'));
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
        return;
    }
    
    /**
     * Add to cart using ajax method
     * @return type
     */
    public function addToCartAction() {
        //unset($_SESSION['cart_item']);
        if($this->request->isPost() && $this->request->isAjax()){
            $getItemProduct  = $this->request->getPost('item_product');
            switch ($this->request->getPost('action')) {
                case 'add':
                    $product    = \Multiple\Backend\Models\Products::find(
                            'product_id=' . (int)$getItemProduct)->getFirst();
                    
                    //Check if quantity was sent with the post
                    $qty        = $this->request->hasPost('qty') ? 
                            $this->request->getPost('qty') : 1;
                    
                    //Set Item Array Values
                    $itemTray   = array(
                        $getItemProduct => array(
                            'name'  => $product->title, 
                            'id'    => $getItemProduct, 
                            'qty'   => $qty, 'option' => '', 
                            'price' => $product->sale_price,
                            
                            //product->added_by returns objects
                            'vendor_id' => $product->added_by,
                            //_____ ______ ______ _____ _____ ____
                            'shipping' => 0, 'tax' => 0, 'coupon' => '', 
                            'subtotal'  => $product->sale_price,
                            //'image' => $this->request->getPost('item_src'),
                            'address'   => \Multiple\Backend\Models\Products::__getAddress($product->added_by, 'address2'),
                            'addedby'   => \Multiple\Backend\Models\Products::__convert($product->added_by, 'display_name'),
                            'location'  => \Multiple\Backend\Models\Products::__getAddress($product->added_by, 'address1')
                        )
                    );
                    if($this->session->has('cart_item') || !empty($_SESSION['cart_item'])){
                        if(array_key_exists($getItemProduct, $this->session->get('cart_item'))){
                            foreach($this->session->get('cart_item') as $keys => $values){
                                if($getItemProduct == $keys){
                                    //Calculate the total price and assign to the session var
                                    $pTaskCounter   = (int)$this->session->get('cart_item')[$getItemProduct]['qty'] + 1;
                                    $_SESSION['cart_item'][$keys]['qty']                                = $pTaskCounter;
                                }
                            }
                        }
                        else{
                            //Do not use array_merge() cos it will reassign the key value(index);
                            //$this->set('cart_item',array_merge($this->session->get('cart_item'),$itemTray));
                            $this->session->set('cart_item',$this->session->get('cart_item') + $itemTray);
                        }
                    }
                    else{
                        $this->session->set('cart_item', $itemTray);
                    }
                    echo count($this->session->get('cart_item'));
                    $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
                    exit();
                    break;
                    
                //Removes the requested item to be deleted    
                case 'remove':
                    if($this->session->has('cart_item') || !empty($_SESSION['cart_item'])){
                        foreach ($this->session->get('cart_item') as $keys => $values){
                            if($getItemProduct == $keys){
                                unset($_SESSION['cart_item'][$keys]);
                            }
                            if(empty($_SESSION['cart_item'])){
                                $this->session->remove('cart_item');
                            }
                        }
                    }
                    echo count($this->session->get('cart_item'));
                    $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
                    exit();
                    break;
                    
                //Clears Everything in the Basket    
                case 'empty':
                    $this->session->remove('cart_item');
                    $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
                    echo 0;
                    exit();
                    break;
            }
        }
        //Hide and Render Page Disabled for. You can return JSON (Noted);
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
        return;
    }
    
    /**
     * display the carts from the basket
     */
    public function showCartAction() {
        if($this->request->hasPost('showcart')){
            $stringBuilt    = ''; $counter = 0; $subTotal = [];
            if(empty($_SESSION['cart_item'])){
                exit('Empty Shopping Basket');
            }
            foreach($this->session->get('cart_item') as $key => $value){
                $subTotal[]     = $value['qty'] * $value['price'];
                $stringBuilt    .= '<div class="cart-item product-summary"><div class="row">
                                <div class="col-xs-7">

                                        <strong class="name"><a href="index.php?page-detail">'.ucwords($value['name']).'</a></strong>
                                        
                                        <div class="qty"><small>('.$value['qty'].' x '.$value['price'].')</small></div>
                                </div>
                                <div class="col-xs-3">
                                    <div class="price">₦'.number_format($value['price'] * $value['qty'], 2).'</div>
                                </div>
                                <div class="col-xs-1 action">
                                        <a href="#" id="remove_qty" title="'.$value['id'].'"><i class="icon wb-power"></i></a>
                                </div>
                        </div></div><!-- /.cart-item -->
                <div class="clearfix"></div>';
            }
            $stringBuilt    .= '<hr>
                    <div class="clearfix cart-total">
                            <div class="pull-right">

                                            <span class="text">Total :</span><span class="price">₦'.number_format(array_sum($subTotal), 2).'</span>

                            </div>
                            <div class="clearfix"></div>

                            <a href="http://localhost/peprice/backend/order/baskets" class="btn btn-upper btn-primary m-t-20"><strong>View Cart</strong></a>	
                            <button type="button" id="emptyTask" class="btn btn-upper btn-danger m-t-20"><strong>Empty</strong> <i class="fa fa-trash"></i> </button>	
                    </div><!-- /.cart-total-->';
            echo !empty($stringBuilt) ? $stringBuilt : 'Empty Shopping Basket(s)';
            $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
            exit;
        }
    }
    
    public function basketAction($id=''){
        $this->assets->collection('headers')->addCss(
                'admin/vendor/bootstrap-sweetalert/sweet-alert.css');
        $this->assets->collection('footers')->addJs(
                'admin/vendor/bootstrap-sweetalert/sweet-alert.js')
                ->addJs('admin/js/taskAssign.js');
        $getAgentsStatus  = $this->__getAgents()['team']->status;
        if($getAgentsStatus == self::ACTION_COMPLETE){
            $this->view->setVar('agents', $this->__getAgents()); 
        }
        else{
            $this->view->setVar('errors', $this->__getAgents());
        }
        if(!empty($id) || !is_null($id)){
            $customer   = \Multiple\Backend\Models\Register::find(
                    'register_id='.$id)->getLast();
            if($customer != FALSE){
                $this->view->setVar('customer', $customer);
                $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
                return;
            }
            else{
                $this->flash->error('Customer Not Found');
                $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
                $this->response->redirect('order/getCustomers?task=error');
                return;
            }
        }
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
        return;
    }
    
    /**
     * view transactions on the right bar
     * @param type $trans
     * @return type
     */
    public function viewAction($trans=''){
        if($this->request->isPost() && $this->request->isAjax()){
            $trans  = $this->request->getPost('trans');
            if(!empty($trans) || !is_null($trans)){
                $salesShow  = \Multiple\Backend\Models\Sales::find('trans_id="'.$trans.'"')->getLast();
                $itemsShow  = json_decode($salesShow->item_sold);
                
                $tableFlow  = '<div class="example table-responsive">
                      <table class="table table-hover">
                        <thead>
                          <tr>
                            <th>#</th>
                            <th>Products x (qty)</th>
                            <th>Price</th>
                            <th>Total</th>
                          </tr>
                        </thead>
                        <tbody>';
                $counter = 1; $costStack = array();
                foreach ($itemsShow as $key => $value) {
                    $costStack[]    = (int) $value->qty * $value->price;
                    $tableFlow .= '<tr>
                        <td>'.$counter.'</td>
                        <td>'.ucwords($value->name).' x ('.$value->qty.')</td>
                        <td>
                          <span data-plugin="peityLine">'.$value->price.'</span>
                        </td>
                        <td>
                          <span class="text-danger text-semibold">'.
                            number_format($value->qty * $value->price, 2).'</span>
                        </td>
                      </tr>';
                    $counter++;
                }
                          
                $tableFlow  .= '</tbody>
                        <tfoot>
                            <tr>
                            <th></th>
                            <th></th>
                            <th>Total</th>
                            <th>'. number_format(array_sum($costStack),2).'</th>
                          </tr>
                        </tfoot>
                          </table>
                    </div>';
                echo $tableFlow;
                $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
                return;
            }
            else{
                $salesShow  = Sales::find()->getLast();
                $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
                return;
            }
        }
        $this->view->disable();
        exit();
    }
    
    public function viewBasketAction(){
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
        return;
    }
    
    public function beforeExecuteRoute(\Phalcon\Mvc\Dispatcher $dispatcher){
        $action     = $dispatcher->getActionName();
        $controller = $dispatcher->getControllerName();
        
    }
    
    public function emtpyBasketAction(){
        if($this->dispatcher->wasForwarded()){
            $this->session->remove('cart_item');
        }
    }
    
    public function basketsAction(){
        $this->__loadCssJssTask();
        $response   = new \Phalcon\Http\Response();
        $key        = $this->request->getPost('key');
        if($this->request->isAjax() && $this->request->isPost()){
            unset($_SESSION['cart_item'][$key]);
            $response->setRawHeader("HTTP/1.1 200 OK");
            $response->setJsonContent(array('status' => 'OK'));
            $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
            $response->send();
            return;
        }
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
        return;
    }
    
    public function updateCartAction(){
        $counter    = 0;
        $response   = new \Phalcon\Http\Response();
        if($this->request->isPost() && $this->request->isAjax()){
            $tyQuantity = $this->request->getPost('quantity');
            foreach($_SESSION['cart_item'] as $keys => $values){
                $subTotal       = $_SESSION['cart_item'][$keys]['price'];
                $urlQuantity    = $this->request->getPost('quantity')[$counter];
                $_SESSION['cart_item'][$keys]['subtotal']   = $subTotal * $urlQuantity;
                $_SESSION['cart_item'][$keys]['qty']        = $urlQuantity;
                $counter++;
            }
            $response->setHeader('Content-Type', 'application/json');
            $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
            $response->setJsonContent(array('status' => 'OK'));
            $response->sendHeaders(); $response->send();
            exit;
        }
    }
    
    public function __loadCssJssTask(){
        $this->assets->collection('headers')->addCss('admin/vendor/bootstrap-sweetalert/sweet-alert.css');
        $this->assets->collection('footers')->addJs('admin/vendor/bootstrap-sweetalert/sweet-alert.js')
                ->addJs('admin/js/taskAssign.js');
    }
    
    public function assignAction(){
        $response   = new \Phalcon\Http\Response();
        if($this->request->isPost() && $this->request->isAjax()){
            $fleet_id   = $this->request->getPost('fleet_id');
            $job_id     = $this->request->getPost('trans_id');
            $jsonString = "{
                    \"api_key\": \"".self::ACESS_TOKEN."\",
                    \"fleet_id\": \"".$fleet_id."\",
                    \"job_id\": \"".$job_id."\"
                }";
            $urlString  = 'https://api.tookanapp.com/v2/assign_task';
            $response->setJsonContent(
                    $this->__curlRequestTask($urlString, $jsonString));
        }
        $response->setHeader('Content-Type', 'application/json');
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
        $response->send();
        exit();
    }
    
    /**
     * Use transaction to perform order now
     */
    public function orderNowAction(){
        $dbError    = '';
        $tracker    = TRUE;
        $response   = new \Phalcon\Http\Response();
        //$track_id   = $this->request->getPost('order');
        parse_str($this->request->getPost('order'), $track_id);
        if($this->request->isAjax() && $this->request->isPost()){
            try{
                $this->__buildRequest(array(
                    'vendor_id' => $this->session->get('auth')['codename']));
                
                $track_id['vendor_id']  = $this->session->get('auth')['codename'];
                $transManager   = new \Phalcon\Mvc\Model\Transaction\Manager();
                $transaction    = $transManager->get();
                $orderNow       = new \Multiple\Backend\Models\Order();
                $orderNow->setTransaction($transaction);
                if(!$orderNow->save($track_id)){
                    $tracker    = FALSE;
                    $transaction->rollback('Order Cannot be Placed');
                    $dbError    = $transaction->getMessages();
                }
                
                $sales          = new \Multiple\Backend\Models\Sales();
                $sales->setTransaction($transaction);
                $startSales     = array(
                            'date_of_order' => date('Y-m-d H:i:s'),
                            'trans_id'      => $track_id['trans_id'],
                            'vendor_id'     => $this->session->get('auth')['codename'],
                            'item_sold'     => json_encode($this->session->get('cart_item')),
                            'agent'         => $track_id['fleet_id'],
                            'delivery_time' => '',
                            'status'        => 'processed',
                        );

                $this->__setKeyTask($track_id['trans_id']);
                $vendor = json_encode($this->session->get('cart_item'));

                if(!$sales->save($startSales)){
                    //var_dump($sales->getMessages()); exit;
                    $transaction->rollback('Unable to make sales');
                }
                $transaction->commit();
            } catch (\Phalcon\Mvc\Model\Transaction\Failed $exc) {
                $tracker    = false;
                $this->flash->error('error: '. $exc->getMessage());
                $response->setJsonContent(array(
                    'status'    => $tracker,
                    'message'   => $exc->getMessage(),
                    'dbaseerr'  => $transaction->getMessages()));

                //var_dump($order->getMessages());
                $exc->getTraceAsString();
            }
            if($tracker){
                $tasking         = array(
                    'team_id'   => 9896,
                    'agent_id'  => $track_id['fleet_id'],
                );
                $customer       = $track_id;
                $customerRes    = $this->__createTask($tasking, $customer);
                $response->setJsonContent(array(
                    'status'    => $tracker,
                    'posted'    => $track_id,
                    'data'      => $customerRes
                ));
            }
            $response->setHeader('Content-Type', 'application/json');
            $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
            $response->send();
            return;
        }
        else{
            $this->response->redirect('order/?task='.
                    $this->component->helper->makeRandomString(15));
            $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
            return;
        }
    }
    
    public function trackerAction(){
        $query  = $this->request->getQuery();
        $this->view->setVar('job_id', $this->request->getQuery('job_id'));
        $this->view->setVar('tr', $this->request->getQuery('tracking_link'));
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
        return;
    }
    
    public function orderTrackerAction(){
        $config = array(
            "host"  => "localhost",
            "user"  => "root",
            "pass"  => "",
            "db"    => "pepperedrice"
        );
        $response   = new \Phalcon\Http\Response();
        $primaryKey = 'j_id'; $table = 'jobs';
        if($this->request->isGet() && $this->request->isAjax()){
            $columns    = array(
                array('db' => 'job_id', 'dt' => 0),
                array('db' => 'trans_id', 'dt' => 1),
                array('db' => 'job_hash', 'dt' => 2),
                array('db' => 'customer_name', 'dt' => 3),
                array('db' => 'customer_address', 'dt' => 4),
                array('db' => 'tracking_link', 'dt' => 5),
                array('db' => 'job_token', 'dt' => 6),
                array('db' => 'j_id', 'dt' => 7),
            );
            $response->setJsonContent(
                    \Multiple\Backend\Plugins\SspPlugin::simple(
                            $_GET, $config, $table, $primaryKey, $columns));
            $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
            $response->setHeader('Content-Type', 'application/json');
            $response->send();
            exit();
        }
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
        return;
    }
    
    public function jobAction(){
        $response   = new \Phalcon\Http\Response();
        if($this->request->isAjax() && $this->request->isPost()){
            $jobTrack   = array(
                'trans_id'          => $this->request->getPost('trans_id'),
                'job_id'            => $this->request->getPost('data')['job_id'],
                'job_hash'          => $this->request->getPost('data')['job_hash'],
                'customer_name'     => $this->request->getPost('data')['customer_name'],
                'customer_address'  => $this->request->getPost('data')['customer_address'],
                'tracking_link'     => $this->request->getPost('data')['tracking_link'],
                'job_token'         => $this->request->getPost('data')['job_token'],
            );
            $job    = new \Multiple\Backend\Models\Job();
            if($job->create($jobTrack) != false){
                $response->setJsonContent(array(
                    'status'    => 'OK'
                ));
            }
            else{
                $response->setJsonContent(array(
                    'status'    => 'ERROR'
                ));
            }
            $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
            $response->setHeader('Content-Type', 'application/json');
            $response->send();
            exit();
        }
    }
    
    private function __getAgents(){
        $response   = '';
        $team       = array(); $status  = false;
        $typeResp   = new \Phalcon\Http\Response();
        if($this->session->has('cart_item')){
            $jsonString = "{
                \"api_key\": \"".self::ACESS_TOKEN."\"
            }";
            $response   = $this->__curlRequestTask(
                    "https://api.tookanapp.com/v2/get_available_agents", $jsonString);
        }
        return array('team' => json_decode($response));
    }
    
    /**
     * $customer variable must be array
     * array(email,lastname,phonenumber,address);
     * @param type $team_id
     * @param array $customer
     * @return type
     */
    public function __createTask($task_id, array $customer){
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "https://api.tookanapp.com/v2/create_task");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_HEADER, FALSE);
        curl_setopt($ch, CURLOPT_POST, TRUE);
        curl_setopt($ch, CURLOPT_POSTFIELDS, "{
            \"api_key\": \"".self::ACESS_TOKEN."\",
            \"order_id\": \"".$customer['trans_id']."\",
            \"team_id\": \"".$task_id['team_id']."\",
            \"auto_assignment\": \"0\",
            \"job_description\": \"Delivery\",
            \"customer_email\": \"".$customer['email']."\",
            \"customer_username\": \"".$customer['lastname']." ".$customer['firstname']."\",
            \"customer_phone\": \"".$customer['phonenumber']."\",
            \"customer_address\": \"".$customer['address']."\",
            \"latitude\": \"\",
            \"longitude\": \"\",
            \"job_delivery_datetime\": \"".date('m/d/Y H:i:s')." \",
            \"has_pickup\": \"0\",
            \"has_delivery\": \"1\",
            \"layout_type\": \"0\",
            \"tracking_link\": 1,
            \"timezone\": \"+1\",
            \"custom_field_template\": \"\",
            \"meta_data\": [
              {
                \"label\": \"\",
                \"data\": \"\"
              }
            ],
            \"fleet_id\": \"".$task_id['agent_id']."\",
            \"ref_images\": [
              \"http://tookanapp.com/wp-content/uploads/2015/11/logo_dark.png\",
              \"http://tookanapp.com/wp-content/uploads/2015/11/logo_dark.png\"
            ],
            \"notify\": 1,
            \"tags\": \"\",
            \"geofence\": 0
        }");
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            "Content-Type: application/json"
        ));
        $response   = curl_exec($ch);
        $returns    = json_decode($response, TRUE);
        curl_close($ch); return $returns;
    }
    
    /**
     * called from customapp.js
     * @return json
     */
    public function tableShowAction(){
        $config = array(
            "host"  => "localhost",
            "user"  => "root",
            "pass"  => "",
            "db"    => "pepperedrice"
        );
        //var_dump($config); exit;
        $response   = new \Phalcon\Http\Response();
        $table  = 'products'; $primaryKey  = 'product_id';
        $columns    = array(
            array('db' => 'title', 'dt' => 0),
            array('db' => 'sub_category', 'dt' => 1, 
                'formatter' => function($d, $row){
                    $category = \Multiple\Backend\Models\Subcategory::find(
                                            'sub_category_id='.$d)->getFirst(); 
                                            return $category->sub_category_name;
                }),
                        
            array('db' => 'added_by', 'dt' => 2, 
                'formatter' => function($string, $row){
                    return \Multiple\Backend\Models\Products::__convert($string, 'display_name');
                }),
                        
            array('db' => 'added_by', 'dt' => 3, 
                'formatter' => function($string, $row){
                    return \Multiple\Backend\Models\Products::__convert($string, 'address1');
                }),
            array('db' => 'sale_price', 'dt' => 4),
            array('db' => 'front_image', 'dt' => 5),
            array('db' => 'product_id', 'dt' => 6),
        );
        if($this->request->isGet() && $this->request->isAjax()){
            $response->setJsonContent(
                    \Multiple\Backend\Plugins\SspPlugin::simple(
                    $_GET, $config, $table, $primaryKey, $columns));
            $response->setHeader('Content-Type', 'application/json');
            $this->view->disable(); $response->send();
        }
        $this->view->disable();
        return;
    }
    
     /**
     * @return string
     * Get the addresses of the shops
     */
    private function __getStringAddress(){
        return join('; ', array_keys($this->__getShopsTask('address')));
    }
    
    /**
     * @return json
     */
    private function __getAvailableFleets(){
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "https://api.tookanapp.com/v2/view_teams");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_HEADER, FALSE);
        curl_setopt($ch, CURLOPT_POST, TRUE);
        
        curl_setopt($ch, CURLOPT_POSTFIELDS, "{
            \"api_key\": \"df6bb34d1342938032946e88cce350dcce17d58c2267a0c74474b933be45823a\"
        }");
        
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            "Content-Type: application/json"
        ));
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
        $response = curl_exec($ch);
        if(curl_errno($ch)){
            var_dump(curl_error($ch));
        }
        curl_close($ch);
        return $response;
    }
    
    /**
     * get total carts price
     * @return int
     */
    public function __getSubTotal(){
        $total  = array();
        foreach($this->session->get('cart_item') as $keys=>$values){
            $total[]    =           $values['qty'] * $values['price'];
        }
        return array_sum($total);
    }
    
    //This method should be used for associative array
    /**
     * @param type $array
     * @return type array;
     */
    public function __buildRequest($array = array()){
        if($this->request->isPost()){
            $_POST   = $this->request->getPost() + $array;
            return $getPost     = $this->request->getPost();
        }
        else{
            $_GET   = $this->request->getQuery() + $array;
            return $getQuery    = $this->request->getQuery();
        }
    }
    
    private function __getArrayNum($array){
        return count($array);
    }
    
    /**
     * @param type $tracker
     * force trans_id into the session array
     */
    private function __setKeyTask($tracker){
        if($this->session->has('cart_item') || isset($_SESSION['cart_item'])){
            foreach($this->session->get('cart_item') as $keys=>$values){
                $_SESSION['cart_item'][$keys]['trans_id']   = $tracker;
            }
        }
    }
    
    /**
     * @param string $key
     * @return array
     * Group array with the same value together
     */
    private function __fixKeyTask($key=''){
        $return = array();
        foreach($this->session->get('cart_item') as $keys=>$values){
            $return[$values[$key]][]   = $values;
        }
        return $return;
    }
    
    /**
     * @param type $url
     * @param type $jsonString
     * @return type
     */
    public function __curlRequestTask($url, $jsonString){
        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_HEADER, FALSE);

        curl_setopt($ch, CURLOPT_POST, TRUE);

        curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonString);

        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
          "Content-Type: application/json"
        ));

        $response = curl_exec($ch);
        curl_close($ch);
        return $response;
    }
}
