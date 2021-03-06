<?php

class ClassDesignation extends CI_Controller {
    
    private $model;
    
    function __construct() {
        parent::__construct();
        $this->load->model('ClassDesignationModel');
        $this->model = new ClassDesignationModel();
    }
    
    function addClassDesignation(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        $data->date_created = $this->penguin->getTime();
        echo $this->model->insertClassDesignation($data);
    }
    
    function getClassDesignations(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page_size = $this->input->get('page-size');
        $page = $this->input->get('page');
        echo json_encode($this->model->getClassDesignations($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
    /** Grading Level Structure **/
    
    function addClassDesignationStructure(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        $data->date_created = $this->penguin->getTime();
        echo $this->model->insertClassDesignationStructure($data);
    }
    
    function getClassDesignationStructures(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page_size = $this->input->get('page-size');
        $page = $this->input->get('page');
        echo json_encode($this->model->getClassDesignationStructures($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
}
