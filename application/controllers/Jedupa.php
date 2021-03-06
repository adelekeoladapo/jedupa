<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Jedupa extends CI_Controller {
    
    private $school_model, $user_model, $user_privilege_model, $examination_model, $student_dept_model, $class_model, $session_model, $quota_model, $grading_level_model, $class_designation_model, $student_category_model, $additional_field_model, $employee_department_model, $employee_category_model, $employee_position_model, $employee_grade_level_model, $subject_model, $class_timing_set_model, $class_period_model, $weekday_model, $class_timetable_model;
    
    function __construct() {
        parent::__construct();
        $this->load->model('SchoolModel');
        $this->load->model('StudentDeptModel');
        $this->load->model('ClassModel');
        $this->load->model('SessionModel');
        $this->load->model('QuotaModel');
        $this->load->model('GradingLevelModel');
        $this->load->model('StudentCategoryModel');
        $this->load->model('AdditionalFieldModel');
        $this->load->model('EmpDepartmentModel');
        $this->load->model('EmpCategoryModel');
        $this->load->model('EmpPositionModel');
        $this->load->model('EmpGradeLevelModel');
        $this->load->model('SubjectModel');
        $this->load->model('ClassTimingSetModel');
        $this->load->model('ClassPeriodModel');
        $this->load->model('WeekdayModel');
        $this->load->model('ClassTimetableModel');
        $this->load->model('ClassDesignationModel');
        $this->load->model('ExaminationModel');
        $this->load->model('UserPrivilegeModel');
        $this->load->model('UserModel');
        $this->school_model = new SchoolModel();
        $this->student_dept_model = new StudentDeptModel();
        $this->class_model = new ClassModel();
        $this->session_model = new SessionModel();
        $this->quota_model = new QuotaModel();
        $this->grading_level_model = new GradingLevelModel();
        $this->student_category_model = new StudentCategoryModel();
        $this->additional_field_model = new AdditionalFieldModel();
        $this->employee_department_model = new EmpDepartmentModel();
        $this->employee_category_model = new EmpCategoryModel();
        $this->employee_position_model = new EmpPositionModel();
        $this->employee_grade_level_model = new EmpGradeLevelModel();
        $this->subject_model = new SubjectModel();
        $this->class_timing_set_model = new ClassTimingSetModel();
        $this->class_period_model = new ClassPeriodModel();
        $this->weekday_model = new WeekdayModel();
        $this->class_timetable_model = new ClassTimetableModel();
        $this->class_designation_model = new ClassDesignationModel();
        $this->examination_model = new ExaminationModel();
        $this->user_privilege_model = new UserPrivilegeModel();
        $this->user_model = new UserModel();
    }

    public function index(){
        $type = $this->session->userdata('type');
        if(!$type){
            redirect(base_url()."login");
        }
        $this->load->view('home');
    }
    
    public function login(){
        $this->load->view('login');
        session_destroy();
    }
    
    function user_login(){
        $username = $this->input->post('username');
        $password = $this->input->post('password');
        $password = $this->encrypt->encode_password($password);
        
        if(($user = $this->user_model->getUser_2($username, $password)) != null){
            $data = array(
                'type'  => 'user',
                'id'     => $user->user_id,
                'privilege_id' => $user->privilege_id
            );
            $this->session->set_userdata($data);
            echo true;
            return;
        }elseif(($user = $this->school_model->getSchool_2($username, $password)) != null){
            $data = array(
                'type'  => 'school',
                'id'     => $user->school_id,
                'privilege_id' => 3//$user->privilege_id
            );
            $this->session->set_userdata($data);
            echo true;
            return;
        }else {
            echo false;
        }
    }
            
    
    function init(){
        
        $type = $this->session->userdata('type');
        $id = $this->session->userdata('id');
        $privilege_id = $this->session->userdata('privilege_id');
        
        $quota = new stdClass();
        $quota->session_id = $this->input->get('session-id');
        $quota->quota_id = $this->input->get('quota-id');
        
        (!$quota->quota_id) ? $quota = false : '';
        
        
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $school_id = $filter_value = $this->input->get('filter-value');
        $page = $this->input->get('page');
        $page_size = $this->input->get('page-size');
        
        if($privilege_id > 2){
            $user = new stdClass();
            if($type == 'school'){
                $user = $this->school_model->getSchool($id);
            }else {
                $user = $this->user_model->getUser($id);
            }
            $data['login_type'] = $type;
            $data['user'] = $user;
            $data['privilege_modules'] = $this->user_privilege_model->getUserPrivilegeActiveModules($privilege_id);
            $data['school'] = $this->school_model->getSchool($school_id);
            $data['student_departments'] = $this->student_dept_model->getStudentDepts($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
            $data['classes'] = $this->class_model->getClasses($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
            $data['class_levels'] = $this->class_model->getLevels($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
            $data['class_types'] = $this->class_model->getTypes($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
            $data['sessions'] = $this->session_model->getSessions($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
            $data['quotas'] = $this->quota_model->getQuotas($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
            $data['grading_levels'] = $this->grading_level_model->getGradingLevels($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
            $data['grading_level_structures'] = $this->grading_level_model->getGradingLevelStructures($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
            $data['class_designations'] = $this->class_designation_model->getClassDesignations($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
            $data['class_designation_structures'] = $this->class_designation_model->getClassDesignationStructures($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
            $data['student_categories'] = $this->student_category_model->getStudentCategories($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
            $data['additional_fields'] = $this->additional_field_model->getAdditionalFields($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
            $data['employee_departments'] = $this->employee_department_model->getEmpDepartments($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
            $data['employee_categories'] = $this->employee_category_model->getEmpCategories($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
            $data['employee_positions'] = $this->employee_position_model->getEmpPositions($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
            $data['employee_grade_levels'] = $this->employee_grade_level_model->getEmpGradeLevels($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
            $data['subjects'] = $this->subject_model->getSubjects($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
            $data['classes_basic_subjects'] = $this->subject_model->getClassesBasicSubjects($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size, $quota);
            $data['class_timing_sets'] = $this->class_timing_set_model->getClassTimingSets($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
            $data['class_periods'] = $this->class_period_model->getClassPeriods($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
            $data['weekdays'] = $this->weekday_model->getWeekdays($sort_field, $sort_order_mode, null, null, $page, $page_size);
            $data['weekday_class_periods'] = $this->class_period_model->getWeekdayClassPeriods($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size, $quota);
            $data['class_timetables'] = $this->class_timetable_model->getClassTimetables($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size, $quota);
            $data['examinations'] = $this->examination_model->getExaminations($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
            $data['examination_timetables'] = $this->examination_model->getExaminationTimetables($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size, $quota);
            $data['examination_groups'] = $this->examination_model->getExamGroups($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
            $data['user_privileges'] = $this->user_privilege_model->getUserPrivileges($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size);
            $data['system_modules'] = $this->user_privilege_model->getModules('position', 'ASC', null, null, $page, $page_size);
            $data['user_privilege_modules'] = $this->user_privilege_model->getUserPrivilegeModules('position', 'ASC', $filter_field, $filter_value, $page, $page_size);

            echo json_encode($data);
        }else{
            echo 'default privileges not ready';
        }
        
    }
        
}
