<?php

/**
 * Description of EmpPosition
 *
 * @author Adeleke Oladapo
 */
class EmpPosition {
    
    private $table_name = 'tb_employee_position';
    
    function insertEmpPosition($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getEmpPositions(){
        $this->db->select('*');
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getEmpPosition($id){
        $this->db->select('*');
        $this->db->where('employee_position_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
}
