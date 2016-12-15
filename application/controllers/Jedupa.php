<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Jedupa extends CI_Controller {
    
    private $school_model, $student_dept_model, $class_model, $session_model, $quota_model, $score_group_model, $student_category_model, $additional_field_model, $employee_department_model, $employee_category_model, $employee_position_model, $employee_grade_level_model, $subject_model;
    
    function __construct() {
        parent::__construct();
        $this->load->model('SchoolModel');
        $this->load->model('StudentDeptModel');
        $this->load->model('ClassModel');
        $this->load->model('SessionModel');
        $this->load->model('QuotaModel');
        $this->load->model('ScoreGroupModel');
        $this->load->model('StudentCategoryModel');
        $this->load->model('AdditionalFieldModel');
        $this->load->model('EmpDepartmentModel');
        $this->load->model('EmpCategoryModel');
        $this->load->model('EmpPositionModel');
        $this->load->model('EmpGradeLevelModel');
        $this->load->model('SubjectModel');
        $this->school_model = new SchoolModel();
        $this->student_dept_model = new StudentDeptModel();
        $this->class_model = new ClassModel();
        $this->session_model = new SessionModel();
        $this->quota_model = new QuotaModel();
        $this->score_group_model = new ScoreGroupModel();
        $this->student_category_model = new StudentCategoryModel();
        $this->additional_field_model = new AdditionalFieldModel();
        $this->employee_department_model = new EmpDepartmentModel();
        $this->employee_category_model = new EmpCategoryModel();
        $this->employee_position_model = new EmpPositionModel();
        $this->employee_grade_level_model = new EmpGradeLevelModel();
        $this->subject_model = new SubjectModel();
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
        $data['classes'] = $this->class_model->getClasses($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
        $data['class_levels'] = $this->class_model->getLevels($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
        $data['class_types'] = $this->class_model->getTypes($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
        $data['sessions'] = $this->session_model->getSessions($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
        $data['quotas'] = $this->quota_model->getQuotas($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
        $data['score_groups'] = $this->score_group_model->getScoreGroups($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
        $data['score_group_structures'] = $this->score_group_model->getScoreGroupStructures($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
        $data['student_categories'] = $this->student_category_model->getStudentCategories($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
        $data['additional_fields'] = $this->additional_field_model->getAdditionalFields($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
        $data['employee_departments'] = $this->employee_department_model->getEmpDepartments($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
        $data['employee_categories'] = $this->employee_category_model->getEmpCategories($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
        $data['employee_positions'] = $this->employee_position_model->getEmpPositions($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
        $data['employee_grade_levels'] = $this->employee_grade_level_model->getEmpGradeLevels($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
        $data['subjects'] = $this->subject_model->getSubjects($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
        $data['classes_basic_subjects'] = $this->subject_model->getClassesBasicSubjects($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
        
        echo json_encode($data);
    }
        
}
