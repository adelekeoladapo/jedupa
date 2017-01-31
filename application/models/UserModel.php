<?php

/**
 * 
 * Description of SchoolModel
 *
 * @author Adeleke Oladapo
 */

class UserModel extends CI_Model {
    
    private $table_name = 'tb_user', $table_student = 'tb_student', $table_employee = 'tb_employee', $table_parent = 'tb_parent', $view_student = 'vw_student', $view_parent = 'vw_parent', $view_employee = 'vw_employee';
    
    function insertUser($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getUsers($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getUser($id){
        $this->db->select('*');
        $this->db->where('user_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    
    /**
     * USER MODEL
     */
    function insertStudent($data){
        $this->db->insert($this->table_student, $data);
        return $this->db->insert_id();
    }
    
    function getStudents($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->view_student);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getStudent($id){
        $this->db->select('*');
        $this->db->where('student_id', $id);
        $query = $this->db->get($this->view_student);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    function generateStudentNumber($school_id, $admission_date){
        $this->load->model('SchoolModel');
        $s = explode("/", $admission_date);
        $adm_year = substr($s[2], 2, 4);
        $school_model = new SchoolModel();
        $unique_code = $school_model->getSchool($school_id)->unique_code;
        $prefix = $unique_code."/".$adm_year;
        
        $this->db->select('registration_number');
        $this->db->like('registration_number', $prefix);
        $this->db->order_by('student_id', 'DESC');
        $query = $this->db->get($this->table_student);
        $last_id = ($query->num_rows()) ? $query->row()->registration_number : false;
        if(!$last_id){
            return $prefix."/1";
        }else{
            $s = explode("/", $last_id);
            $num = $s[2]; $num++;
            return $prefix."/".$num;
        }    
    }
    
    /**
     * Parent Model
     */
    function insertParent($data){
        $this->db->insert($this->table_parent, $data);
        return $this->db->insert_id();
    }
    
    function getParents($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->view_parent);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getParent($id){
        $this->db->select('*');
        $this->db->where('parent_id', $id);
        $query = $this->db->get($this->view_parent);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    
    /*
     * Employee Model
     */
    function insertEmployee($data){
        $this->db->insert($this->table_employee, $data);
        return $this->db->insert_id();
    }
    
    function getEmployees($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->view_employee);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getEmployee($id){
        $this->db->select('*');
        $this->db->where('employee_id', $id);
        $query = $this->db->get($this->view_employee);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
}
