<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Edugate extends CI_Controller {
    
    private $school_model, $student_dept_model;
    
    function __construct() {
        parent::__construct();
        $this->load->model('SchoolModel');
        $this->load->model('StudentDeptModel');
        $this->school_model = new SchoolModel();
        $this->student_dept_model = new StudentDeptModel();
    }

    public function index(){
        $this->load->view('home');
    }
    
    function init(){
        $school_id = $this->input->get('school-id');
    }
        
}
