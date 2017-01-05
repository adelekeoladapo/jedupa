<?php

class Weekday extends CI_Controller {
    
    private $model;
    
    function __construct() {
        parent::__construct();
        $this->load->model('WeekdayModel');
        $this->model = new WeekdayModel();
    }
    
    function addWeekday(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        echo $this->model->insertWeekday($data);
    }
    
    function getWeekdays(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page = $this->input->get('page');
        $page_size = $this->input->get('page-size');
        echo json_encode($this->model->getWeekdays($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
}
