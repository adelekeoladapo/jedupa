<?php

class ClassPeriod extends CI_Controller {
    
    private $model, $class_timetable_model;
    
    function __construct() {
        parent::__construct();
        $this->load->model('ClassPeriodModel');
        $this->load->model('ClassTimetableModel');
        $this->model = new ClassPeriodModel();
        $this->class_timetable_model = new ClassTimetableModel();
    }
    
    function addClassPeriod(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        echo $this->model->insertClassPeriod($data);
    }
    
    function getClassPeriods(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page = $this->input->get('page');
        $page_size = $this->input->get('page-size');
        echo json_encode($this->model->getClassPeriods($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
    /******* Weekday Class Period ******/
    function addWeekdayClassPeriod(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        echo $this->model->insertWeekdayClassPeriod($data);
    }
    
    function getWeekdayClassPeriods(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page = $this->input->get('page');
        $page_size = $this->input->get('page-size');
        echo json_encode($this->model->getWeekdayClassPeriods($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
    function deleteWeekdayClassPeriod(){
        $weekday_id = $this->input->get('weekday-id');
        $class_id = $this->input->get('class-id');
        $this->model->deleteWeekdayClassPeriod_($class_id, $weekday_id);
        $this->class_timetable_model->clearWeekdayClassTimetable($class_id, $weekday_id);
    }
    
}
