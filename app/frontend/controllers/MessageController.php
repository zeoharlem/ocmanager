<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Multiple\Frontend\Controllers;

/**
 * Description of MessageController
 *
 * @author Theophilus Alamu <theophilus.alamu at gmail.com>
 */
class MessageController extends BaseController{
    //put your code here
    
    public function initialize() {
        parent::initialize();
        \Phalcon\Tag::appendTitle('Send Message');
    }
    
    public function indexAction(){
        $message    = \Multiple\Frontend\Models\Message::find('register_id='.
                        $this->session->get('auth')['register_id'])->toArray();
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
        return;
    }
    
    public function sendmessageAction(){
        if($this->request->isPost() && !$this->request->isAjax()){
            $message    = new \Multiple\Frontend\Models\Message();
            if($message->create($this->request->getPost())){
                $this->flash->success('Message sent succesfully');
                $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
                $this->response->redirect('message/sendmessage?task=true');
            }
            else{
                $this->flash->error('Unable to send message to the service');
                $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
                $this->response->redirect('message/sendmessage?task=false');
            }
        }
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
        return;
    }
}
