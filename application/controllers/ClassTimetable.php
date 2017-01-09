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
    
}
