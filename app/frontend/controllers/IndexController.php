<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of i
 *
 * @author Theophilus Alamu <theophilus.alamu at gmail.com>
 */
namespace Multiple\Frontend\Controllers;

use Multiple\Frontend\Models\Vendor,
    Multiple\Frontend\Models\Category,
    Multiple\Frontend\Models\Products;

use Multiple\Frontend\Models\Admin;

class IndexController extends BaseController{
    //put your code here
    public function initialize() {
        parent::initialize();
        \Phalcon\Tag::appendTitle('Welcome');
        $this->view->setVar('agents', $this->__getAgents(10));
    }
    
    public function indexAction(){
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
        return;
    }
    
    public function show404(){
        
    }
    
    public function show409(){
        
    }
    
    private function __getAgents($limit=''){
        return !empty($limit) ? Admin::find(array(
            'limit' => $limit, 'order' => 'RAND()'))->toArray() : 
            Admin::find(array('order' => 'RAND()'))->toArray();
    }
}
