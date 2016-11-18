<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Register
 *
 * @author Theophilus Alamu <theophilus.alamu at gmail.com>
 */
namespace Multiple\Backend\Models;

use Phalcon\Validation\Validator;

class Register extends BaseModel{
    public $password, $passlookup;
    //put your code here
    public function initialize(){
        
    }
    
    public function beforeValidationOnCreate(){
        $this->role     = 'user';
        $this->codename = $this->getDI()->get(
                'component')->helper->makeRandomInts();
        $this->password = $this->getDI()->get('component')->helper->makeRandomString();
    }
    
    public function afterValidationOnCreate(){
        
    }
    
    public function validation(){
        $validate   = new \Phalcon\Validation();
        $validate->add('email', new Validator\Uniqueness(array(
            'model'     => $this,
            'message'   => 'Email Already Existed'
        )));
        $validate->add('email', new Validator\Email(array(
            'model'     => $this,
            'message'   => 'Email not valid one | email string'
        )));
        $validate->add('phonenumber', new Validator\Uniqueness(array(
            'model'     => $this,
            'message'   => 'Phone Number Already Existed'
        )));
        $this->passlookup   = $this->password;
        $security           = new \Phalcon\Security();
        $this->password     = $security->hash($this->password);
        
        return $this->validate($validate);
    }
}
