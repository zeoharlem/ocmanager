<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Order
 *
 * @author Theophilus Alamu <theophilus.alamu at gmail.com>
 */
namespace Multiple\Backend\Models;

class Order extends BaseModel{
    //put your code here
    public function initialize(){
        $this->allowEmptyStringValues(array(
            'additional_info',
            'postzip','state',
            'city','company'));
        $this->skipAttributesOnCreate(array(
            'additional_info',
            'postzip','state','city','company'));
        
        $this->date_of_order    = new \Phalcon\Db\RawValue('now()');
    }
}
