<?php

class UserPrivilege extends CI_Controller {
    
    private $model;
    
    function __construct() {
        parent::__construct();
        $this->load->model('UserPrivilegeModel');
        $this->model = new UserPrivilegeModel();
    }
    
    function addUserPrivilege(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        $data->date_created = $this->penguin->getTime();
        $id = $this->model->insertUserPrivilege($data);
        
        //insert default module properties
        $modules = $this->model->getModules();
        $data = new stdClass();
        $data->user_privilege_id = $id;
        foreach($modules as $module){
            $data->module_id = $module->module_id;
            $this->model->insertUserPrivilegeModule($data);
        }
    }
    
    function getUserPrivileges(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page = $this->input->get('page');
        $page_size = $this->input->get('page-size');
        echo json_encode($this->model->getUserPrivileges($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
    
    /** User Privilege Modules **/
    
    function insertUserPrivilegeModules(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        foreach ($data as $d) {
            unset($d->module); unset($d->privilege);
            $this->model->insertUserPrivilegeModule($d);
        }
    }
    
    function getUserPrivilegeModules(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page = $this->input->get('page');
        $page_size = $this->input->get('page-size');
        echo json_encode($this->model->getUserPrivilegeModules($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
    
}
