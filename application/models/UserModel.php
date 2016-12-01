<?php

/**
 * 
 * Description of SchoolModel
 *
 * @author Adeleke Oladapo
 */

class UserModel extends CI_Model {
    
    private $table_name = 'tb_user', $table_student = 'tb_student', $table_employee = 'tb_employee', $table_parent = 'tb_parent', $view_student = 'vw_student';
    
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
    
    /**
     * PARENT MODEL
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
        $query = $this->db->get($this->table_parent);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getParent($id){
        $this->db->select('*');
        $this->db->where('parent_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    
}
