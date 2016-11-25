<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of DashboardController
 *
 * @author Theophilus Alamu <theophilus.alamu at gmail.com>
 */
namespace Multiple\Backend\Controllers;

class DashboardController extends BaseController{
    //put your code here
    public function initialize() {
        parent::initialize();
        \Phalcon\Tag::appendTitle('Dashboard');
        $this->assets->collection('headers')->addCss("assets/css/dashboard/v2.css");
    }
    
    public function indexAction(){
        $this->view->setVars(array(
            'cart_item' => $this->session->get('cart_item'),
            'trans_id'  => $this->component->helper->makeRandomInts(10)));
        $this->view->setVar('grandTotal',           $this->__getItemTotal());
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_AFTER_TEMPLATE);
        return;
    }
    
    public function taskHalfAction(){
        $this->view->setVar('query', $this->request->getQuery());
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_AFTER_TEMPLATE);
        return;
    }
    
    public function taskFullAction(){
        $this->session->remove('cart_item');
        $this->view->setVar('query', $this->request->getQuery());
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_AFTER_TEMPLATE);
        return;
    }
    
    private function __getItemTotal(){
        $totalAmount    = []; $counter  = 0;
        foreach($this->session->get('cart_item') as $keys=>$values){
            foreach($values as $index => $elements){
                if($index == 'price'){
                    $q  = $values['qty'];
                    $totalAmount[]  = $elements * $q;
                }
            }
        }
        return (array_sum($totalAmount));
        exit();
    }
}
