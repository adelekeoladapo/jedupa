<?php

class ClassTimetable extends CI_Controller {
    
    private $model;
    
    function __construct() {
        parent::__construct();
        $this->load->model('ClassTimetableModel');
        $this->model = new ClassTimetableModel();
    }
    
    function addClassTimetable(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        echo $this->model->insertClassTimetable($data);
    }
    
    function addClassWeekdaysPeriodsSubjects(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        $timetable = new stdClass();
        $timetable->class_id = $data->class_id;
        $timetable->school_id = $data->school_id;
        $timetable->class_basic_subject_id = $data->class_basic_subject_id;
        $periods = $data->periods;
        foreach ($periods as $period) {
            $timetable->weekday_id = $period->weekday_id;
            $timetable->class_period_id = $period->class_period_id;
            $this->model->insertClassTimetable($timetable);
        }
    }
    
    function getClassTimetables(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page = $this->input->get('page');
        $page_size = $this->input->get('page-size');
        echo json_encode($this->model->getClassTimetables($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
}
