<?php

/**
 * Description of SchoolModel
 *
 * @author Adeleke Oladapo
 */

class SessionModel extends CI_Model {
    
    private $table_name = 'tb_session';
    
    function insertSession($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getSessions(){
        $this->db->select('*');
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getSession($id){
        $this->db->select('*');
        $this->db->where('session_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
}
