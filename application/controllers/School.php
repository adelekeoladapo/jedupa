<?php

/**
 * Description of School
 *
 * @author Adeleke Oladapo
 */
class School extends CI_Controller {
    
    private $model;
    
    function __construct() {
        parent::__construct();
        $this->load->model('SchoolModel');
        $this->model = new SchoolModel();
    }
    
    function updateSchool(){
        $data = new stdClass();
        
        $school_id = $this->input->post('school-id');
        
        /** Upload Logo **/
        $image = $this->upload->upload_image('photo', $school_id);
        if($image->status){
            $data->logo = $image->message['file_name'];
        }else{
            if($image->message == '<p>You did not select a file to upload.</p>'){
                
            }else{
                echo json_encode($image);
                return;
            }
        }
        
        $data->unique_code = $this->input->post('unique_code');
        $data->name = $this->input->post('name');
        $data->code = $this->input->post('code');
        $data->address1 = $this->input->post('address');
        $data->phone1 = $this->input->post('phone-1');
        $data->phone2 = $this->input->post('phone-2');
        $data->country_id = $this->input->post('country-id');
        $data->state_id = $this->input->post('state-id');
        $data->auto_gen_student_id = $this->input->post('auto-generate-student-id');
        $data->auto_gen_employee_id = $this->input->post('auto-generate-employee-id');
        $data->auto_gen_parent_id = $this->input->post('auto-generate-parent-id');
        $data->email = $this->input->post('email');
        $data->website = $this->input->post('website');
        $data->motto = $this->input->post('motto');
        
        $id = $this->model->updateSchool($school_id, $data);
        
        echo json_encode(array('status' => true, 'message' => 'Updated successfully'));
    }
    
    function getSchool(){
        $id = 1;//$this->input->post('school-id');
        echo json_encode($this->model->getSchool($id));
    }
    
}
