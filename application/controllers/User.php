<?php

class User extends CI_Controller {
    
    private $model, $additonal_fields_model;
    
    function __construct() {
        parent::__construct();
        $this->load->model('UserModel');
        $this->load->model('AdditionalFieldModel');
        $this->model = new UserModel();
        $this->additonal_fields_model = new AdditionalFieldModel();
    }
    
    function login(){
        $data['error'] = '';
        $this->load->view('login', $data);
    }
    
    function addStudent(){
        $school_id = $this->input->post('school-id');
        $data = new stdClass();
        
        /** Upload Logo **/
        $image = $this->upload->upload_image('photo', $school_id);
        if($image->status){
            $data->photo = $image->message['file_name'];
        }else{
            if($image->message == '<p>You did not select a file to upload.</p>'){
                
            }else{
                echo json_encode($image);
                return;
            }
        }
        $data->school_id = $school_id;
        $data->firstname = $this->input->post('firstname');
        $data->lastname = $this->input->post('lastname');
        $data->othernames = $this->input->post('other-names');
        $data->gender = $this->input->post('gender');
        $data->dob = date_format(new DateTime($this->input->post('dob')), "Y-m-d");
        $data->phone1 = $this->input->post('phone-no');
        $data->email = $this->input->post('email');
        $data->state_id = $this->input->post('state-id');
        $data->city = $this->input->post('city');
        $data->address = $this->input->post('address');
        
        $user_id = $this->model->insertUser($data);
        
        
        /** add student parent **/
        $pu_data = new stdClass();
        $pu_data->firstname = $this->input->post('parent-name');
        $pu_data->phone1 = $this->input->post('parent-phone');
        $pu_data->email = $this->input->post('parent-email');
        $pu_data->address = $this->input->post('parent-address');
        $pu_data->school_id = $school_id;
        $parent_user_id = $this->model->insertUser($pu_data);
        $p_data = new stdClass();
        $p_data->user_id = $parent_user_id;
        $p_data->date_created = $this->penguin->getTime();
        $p_data->school_id = $school_id;
        $parent_id = $this->model->insertParent($p_data);
        
        
        /** student table data **/
        $s_data = new stdClass();
        $s_data->user_id = $user_id;
        $s_data->school_id = $school_id;
        $s_data->admission_date = date_format(new DateTime($this->input->post('admission-date')), "Y-m-d");
        $s_data->registration_number = $this->input->post('reg-no');
        $s_data->admission_date = $this->input->post('admission-date');
        $s_data->student_department_id = $this->input->post('department-id');
        $s_data->student_category_id = $this->input->post('category-id');
        $s_data->class_type_id = $this->input->post('class-type-id');
        $s_data->class_level_id = $this->input->post('class-level-id');
        $s_data->class_id = $this->input->post('class-id');
        $s_data->parent_relationship = $this->input->post('parent-relationship');
        $s_data->parent_id = $parent_id;
        $s_data->date_created = $this->penguin->getTime();
        
        $student_id = $this->model->insertStudent($s_data);
        
        /** additional fields **/
        $fields = $this->additonal_fields_model->getAdditionalFields(false, false, 'type', 'student', false, '');
        $_data = NEW stdClass();
        $_data->school_id = $school_id;
        $_data->user_id = $user_id;
        foreach ($fields as $field) {
            $d = $field->user_additional_field_id;
            $_data->user_additional_field_id = $d;
            $_data->value = $this->input->post($d);
            $this->additonal_fields_model->insertAdditionalDetail($_data);
        }
        
        echo json_encode(array('status' => true, 'message' => 'Student added successfully'));
        
    }
    
    function getStudents(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page = $this->input->get('page');
        $page_size = $this->input->get('page-size');
        echo json_encode($this->model->getStudents($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
    function getStudent(){
        $id = $this->input->get('student_id');
        $data = $this->model->getStudent($id);
        $data->additional_details = $this->additonal_fields_model->getUserAdditionalDetails($data->user_id, 'student');
        echo json_encode($data);
    }
    
}
