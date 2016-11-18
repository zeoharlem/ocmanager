<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of CustomerController
 *
 * @author Theophilus Alamu <theophilus.alamu at gmail.com>
 */
namespace Multiple\Backend\Controllers;

use Phalcon\Paginator\Adapter\QueryBuilder;
use Multiple\Backend\Models\Register;

class CustomerController extends BaseController{
    //put your code here
    const LIMIT = 20;
    private $_currentPage, $_searchQuery;

    public function initialize() {
        parent::initialize();
        \Phalcon\Tag::appendTitle('Customers');
        $this->assets->collection('headers')
                ->addCss('admin/css/pages/user.css');
        $this->assets->collection('headers')->addCss(
                'admin/vendor/datatables-bootstrap/dataTables.bootstrap.css')
                ->addCss('admin/vendor/datatables-fixedheader/dataTables.fixedHeader.css')
                ->addCss('admin/vendor/datatables-responsive/dataTables.responsive.css');
        
        $this->_currentPage = $this->request->getQuery('p', 'int');
        
        $this->assets->collection('footers')->addJs(
                'admin/vendor/datatables/jquery.dataTables.min.js')
                ->addJs('admin/vendor/datatables-fixedheader/dataTables.fixedHeader.js')
                ->addJs('admin/vendor/datatables-bootstrap/dataTables.bootstrap.js')
                ->addJs('admin/vendor/datatables-responsive/dataTables.responsive.js')
                ->addJs('admin/vendor/datatables-tabletools/dataTables.tableTools.js')
                ->addJs('admin/js/customapp.js')
                ->addJs('admin/js/customer.js');
    }
    
    public function indexAction(){
        if(!$this->_currentPage){
            $this->_currentPage = 1;
        }
        $this->_searchQuery = $this->request->getQuery('q','string');
        $builder            = $this->modelsManager->createBuilder();
        
        $queryBuilt = $builder->from('Multiple\Backend\Models\Register')
                ->orderBy('Multiple\Backend\Models\Register.register_id')
                ->limit(self::LIMIT, ($this->_currentPage - 1) * self::LIMIT);
        
        $paginator  = new QueryBuilder(array(
            'builder'   => $queryBuilt, 
            'limit'     => self::LIMIT, 
            'page'      => $this->_currentPage));
        $this->view->setVars(array(
            "search_query"  => $this->_searchQuery,
            "paginator"     => $paginator->getPaginate(), 
            "customers"     => $queryBuilt->getQuery()->execute(),
            "offset"    => ($this->_currentPage - 1) * self::LIMIT
        ));
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
        return;
    }
    
    public function registerAction(){
        if($this->request->isPost() && !$this->request->isAjax()){
            $register   = new Register();
            if($register->create($this->request->getPost())){
                $this->flash->success('Registration done succesfully');
                $this->view->setRenderLevel(Phalcon\Mvc\View::LEVEL_NO_RENDER);
                $this->response->redirect('customer/register?task=success');
            }
            $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
            return;
        }
        elseif($this->request->isPost() && $this->request->isAjax()){
            $register   = new Register();
            $response   = new \Phalcon\Http\Response();
            if($register->create($this->request->getPost())){
                $response->setHeader('Content-Type', 'application/json');
                $response->setJsonContent(array('status' => true));
            }
            else{
                $response->setHeader('Content-Type', 'application/json');
                $response->setJsonContent(array(
                    'status' => false, 'error' => $register->getMessages()));
            }
            $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
            $response->send();
            exit();
        }
    }
    
    public function getphoneAction(){
        $register   = Register::find(array('group' => 'phonenumbers'));
        $register->setHydrateMode(\Phalcon\Mvc\Model\Resultset::HYDRATE_ARRAYS);
        $this->view->setVar('phones', $register->toArray());
    }
    
    public function showAction(){
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
}
