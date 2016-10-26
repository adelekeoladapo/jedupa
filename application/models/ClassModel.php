<?php


/**
 * Description of QuotaModel
 *
 * @author Adeleke Oladapo
 */
class ClassModel extends CI_Model {
    
    private $table_name = 'tb_class';
    
    function insertClass($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getClasses(){
        $this->db->select('*');
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getClass($id){
        $this->db->select('*');
        $this->db->where('class_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
}
