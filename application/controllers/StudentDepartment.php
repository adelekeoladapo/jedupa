<?php

class StudentDepartment extends CI_Controller {
    
    private $model;
    
    function __construct() {
        parent::__construct();
        $this->load->model('StudentDeptModel');
        $this->model = new StudentDeptModel();
    }
    
    function addDept(){
        echo 'add dept';
    }
    
}
