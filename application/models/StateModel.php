<?php


/**
 * Description of QuotaModel
 *
 * @author Adeleke Oladapo
 */
class StateModel extends CI_Model {
    
    private $table_name = 'tb_state';
    
    function insertState($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getStates(){
        $this->db->select('*');
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getState($id){
        $this->db->select('*');
        $this->db->where('id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
}
