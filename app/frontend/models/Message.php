<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Multiple\Frontend\Models;

/**
 * Description of Message
 *
 * @author Theophilus Alamu <theophilus.alamu at gmail.com>
 */
class Message extends BaseModel{
    //put your code here
    public function initialize(){
        
    }
    
    public function beforeValidationOnCreate(){
        $this->date_reg = new \Phalcon\Db\RawValue('NOW()');
    }
}
