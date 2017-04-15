<?php

class BehaviouralTrait extends CI_Controller{
    
    private $psychometer_model;
    
    function __construct() {
        parent::__construct();
        $this->load->model('BehaviouralTraitModel');
        $this->psychometer_model = new BehaviouralTraitModel();
    }
    
    function addPsychometer(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        $data->date_created = $this->penguin->getTime();
        echo $this->psychometer_model->insertPsychometer($data);
    }
    
    function getPsychometers(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page = $this->input->get('page');
        $page_size = $this->input->get('page-size');
        echo json_encode($this->psychometer_model->getPsychometers($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
    function updatePsychometer(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        echo $this->psychometer_model->updatePsychometer($data);
    }
    
    function addUserPsychomotor(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        echo $this->psychometer_model->insertUserPsychometer($data);
    }
    
    function getClassQuotaPsychomotors(){
        $class_id = $this->input->get('class-id');
        $quota_id = $this->input->get('quota-id');
        echo json_encode($this->psychometer_model->getClassQuotaPsychometers($class_id, $quota_id));
    }
    
    
    ///////// Effective Areas ///////////
    
    function addEffectiveArea(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        $data->date_created = $this->penguin->getTime();
        echo $this->psychometer_model->insertEffectiveArea($data);
    }
    
    function getEffectiveAreas(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page = $this->input->get('page');
        $page_size = $this->input->get('page-size');
        echo json_encode($this->psychometer_model->getEffectiveAreas($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
    function updateEffectiveArea(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        echo $this->psychometer_model->updateEffectiveArea($data);
    }
    
    function addUserEffectiveArea(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        echo $this->psychometer_model->insertUserEffectiveArea($data);
    }
    
    function getClassQuotaEffectiveAreas(){
        $class_id = $this->input->get('class-id');
        $quota_id = $this->input->get('quota-id');
        echo json_encode($this->psychometer_model->getClassQuotaEffectiveAreas($class_id, $quota_id));
    }
    
}
