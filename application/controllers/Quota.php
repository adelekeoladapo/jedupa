<?php

class Quota extends CI_Controller {
    
    private $model;
    
    function __construct() {
        parent::__construct();
        $this->load->model('QuotaModel');
        $this->model = new QuotaModel();
    }
    
    function addQuota(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        $data->date_created = $this->penguin->getTime();
        $data->start_time = date_format(new DateTime($data->start_time), "Y-m-d");
        $data->end_time = date_format(new DateTime($data->end_time), "Y-m-d");
        echo $this->model->insertQuota($data);
    }
    
    function getQuotas(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page_size = $this->input->get('page-size');
        $page = $this->input->get('page');
        echo json_encode($this->model->getQuotas($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
    function updateQuota(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        echo $this->model->updateQuota($data);
    }
    
    function changeQuotaStatus(){
        
    }
    
    
}
