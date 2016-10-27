<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Jedupa extends CI_Controller {
    
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
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $school_id = $filter_value = $this->input->get('filter-value');
        $page = $this->input->get('page');
        $page_size = $this->input->get('page-size');
        
        $data['school'] = $this->school_model->getSchool($school_id);
        $data['student_departments'] = $this->student_dept_model->getStudentDepts($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
        
        echo json_encode($data);
    }
        
}
