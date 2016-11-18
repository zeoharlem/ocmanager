<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of AgentsController
 *
 * @author Theophilus Alamu <theophilus.alamu at gmail.com>
 */
namespace Multiple\Backend\Controllers;

class AgentsController extends BaseController{
    //put your code here
    private $_config    = array();
    //const ACESS_TOKEN = 'e824c4f685bca92ed63ffd522a855f52';
    const ACESS_TOKEN = 'df6bb34d1342938032946e88cce350dcce17d58c2267a0c74474b933be45823a';
    const PARAMETER_MISSING = 100, ACTION_COMPLETE = 200, SHOW_ERROR_MESSAGE = 201;
    const INVALID_ACCESS_TOKEN = 101, ERROR_IN_EXECUTION = 404;
    
    public function initialize() {
        parent::initialize();
        \Phalcon\Tag::appendTitle('Agents');
        $this->_config  = array(
            "host"  => "localhost",
            "user"  => "root",
            "pass"  => "",
            "db"    => "pepperedrice"
        );
    }
    
    public function indexAction(){
        $url    = "";
        if($this->request->isPost() && !$this->request->isAjax()){
            $agents = new \Multiple\Backend\Models\Admin();
            if($agents->save($this->request->getPost())){
                $returns    = $this->__curlRequestTask($url, $jsonString);
                $arrayRes   = json_decode($returns);
                if($arrayRes['message'] == self::ACTION_COMPLETE){
                    $this->flash->success('Agent Created Successfully');
                    $this->response->redirect('index?task=agent&view=success');
                    $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
                }
            }
        }
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
        return;
    }
    
    public function taskAction(){
        $response   = new \Phalcon\Http\Response();
        $primaryKey = 'order_id'; $table = 'order';
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
                            $_GET, $this->_config, $table, $primaryKey, $columns));
            $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
            $response->setHeader('Content-Type', 'application/json');
            $response->send();
            exit();
        }
    }
    
    public function getTaskAction($agent_id){
        $jsonString = "{
                \"access_token\": \"".self::ACESS_TOKEN."\"
            }";
        $url    = "https://api.tookanapp.com/v2/get_available_agents";
        $this->__curlRequestTask($url, $jsonString);
    }
    
    public function listAgentAction(){
        $agents = \Multiple\Backend\Models\Admin::find();
        $agents->setHydrateMode(\Phalcon\Mvc\Model\Resultset::HYDRATE_OBJECTS);
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
    }
}
