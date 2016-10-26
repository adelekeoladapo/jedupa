<?php

/**
 * Description of SchoolModel
 *
 * @author Adeleke Oladapo
 */

class SchoolModel extends CI_Model {
    
    private $table_name = 'tb_school';
    
    function insertSchool($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getSchools(){
        $this->db->select('*');
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getSchool($id){
        $this->db->select('*');
        $this->db->where('school_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    function updateSchool($id, $data){
        $this->db->where('school_id', $id);
        return $this->db->update('tb_school', $data);
    }
    
}
