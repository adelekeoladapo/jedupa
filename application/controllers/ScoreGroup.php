<?php

class ScoreGroup extends CI_Controller {
    
    private $model;
    
    function __construct() {
        parent::__construct();
        $this->load->model('ScoreGroupModel');
        $this->model = new ScoreGroupModel();
    }
    
    function addScoreGroup(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        $data->date_created = $this->penguin->getTime();
        echo $this->model->insertScoreGroup($data);
    }
    
    function getScoreGroups(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page_size = $this->input->get('page-size');
        $page = $this->input->get('page');
        echo json_encode($this->model->getScoreGroups($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
    /** Score Group Structure **/
    
    function addScoreGroupStructure(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        $data->date_created = $this->penguin->getTime();
        echo $this->model->insertScoreGroupStructure($data);
    }
    
    function getScoreGroupStructures(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page_size = $this->input->get('page-size');
        $page = $this->input->get('page');
        echo json_encode($this->model->getScoreGroupStructures($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
}
