<?php


/**
 * Description of QuotaModel
 *
 * @author Adeleke Oladapo
 */
class BatchModel extends CI_Model {
    
    private $table_name = 'tb_batch';
    
    function insertBatch($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getBatches(){
        $this->db->select('*');
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getBatch($id){
        $this->db->select('*');
        $this->db->where('quota_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
}
