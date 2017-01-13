<?php

class Examination extends CI_Controller {
    
    private $model;
    
    function __construct() {
        parent::__construct();
        $this->load->model('ExaminationModel');
        $this->model = new ExaminationModel();
    }
    
    function addExamination(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        $data->date_created = $this->penguin->getTime();
        echo $this->model->insertExamination($data);
    }
    
    function getExaminations(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page = $this->input->get('page');
        $page_size = $this->input->get('page-size');
        echo json_encode($this->model->getExaminations($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
}
