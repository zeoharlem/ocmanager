<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Multiple\Backend\Models;

/**
 * Description of Message
 *
 * @author Theophilus Alamu <theophilus.alamu at gmail.com>
 */
class Message extends BaseModel{
    //put your code here
    public $category;
    
    public function initialize(){
        $this->useDynamicUpdate(true);
        $this->belongsTo('category_id', 
                'Multiple\\Backend\\Models\\Category', 
                'category_id',array('reusable' => true, 'foreignKey' => true, 'alias' => 'Msgcat'));
    }
    
    public function beforeValidationOnCreate(){
        $this->date_reg     = new \Phalcon\Db\RawValue('NOW()');
        $this->register_id  = $this->getDI()->getSession()->get('auth')['register_id'];
        $this->status       = "pending";
    }
}
