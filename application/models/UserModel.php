<?php

/**
 * Description of SchoolModel
 *
 * @author Adeleke Oladapo
 */

class UserModel extends CI_Model {
    
    private $table_name = 'tb_user';
    
    function insertUser($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getUsers(){
        $this->db->select('*');
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getUser($id){
        $this->db->select('*');
        $this->db->where('student_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
}
