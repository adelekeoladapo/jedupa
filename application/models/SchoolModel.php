<?php

/**
 * Description of SchoolModel
 *
 * @author Adeleke Oladapo
 */

class SchoolModel extends CI_Model {
    
    private $table_name = 'tb_school', $view_school = 'vw_school';
    
    function insertSchool($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getSchool($id){
        $this->db->select('*');
        $this->db->where('school_id', $id);
        $query = $this->db->get($this->view_school);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    function getSchool_2($unique_code, $password){
        $this->db->select('*');
        $this->db->where('unique_code', $unique_code);
        $this->db->where('password', $password);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    function updateSchool($id, $data){
        $this->db->where('school_id', $id);
        return $this->db->update($this->table_name, $data);
    }
    
    function getSchools($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = 25){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
}
