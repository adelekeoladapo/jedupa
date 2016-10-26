<?php

class GradingSystemModel {
    
    private $table_name = 'tb_grading_system';
    
    function insertGradingSystem($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getGradingSystems(){
        $this->db->select('*');
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getGradingSystem($id){
        $this->db->select('*');
        $this->db->where('grading_system_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
}
