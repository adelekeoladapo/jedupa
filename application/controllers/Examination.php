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
    
    function updateExamination(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        echo $this->model->updateExamination($data);
    }
    
    /** Create Class Examination Timetable **/
    
    function createClassExamTimetable(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        $timetable = new stdClass();
        $timetable->school_id = $data->examination->school_id;
        $timetable->session_id = $data->examination->session_id;
        $timetable->quota_id = $data->examination->quota_id;
        $timetable->examination_id = $data->examination->examination_id;
        foreach ($data->timetable as $tt) {
            $timetable->subject_id = $tt->subject_id;
            $timetable->max_score = $tt->max_score;
            $timetable->start_time = $tt->start_time;
            $timetable->end_time = $tt->end_time;
            $timetable->subject = $tt->subject;
            $this->model->insertExaminationTimetable($timetable);
        }
    }
    
    function addExaminationTimetable(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        $data->date_created = $this->penguin->getTime();
        echo $this->model->insertExaminationTimetable($data);
    }
    
    function getExamTimetables(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page = $this->input->get('page');
        $page_size = $this->input->get('page-size');
        echo json_encode($this->model->getExaminationTimetables($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
}
