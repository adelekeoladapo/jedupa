<?php


/**
 * Description of QuotaModel
 *
 * @author Adeleke Oladapo
 */
class SubjectModel extends CI_Model {
    
    private $table_name = 'tb_batch';
    
    function insertSubject($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getSubjects(){
        $this->db->select('*');
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getSubject($id){
        $this->db->select('*');
        $this->db->where('subject_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
}
