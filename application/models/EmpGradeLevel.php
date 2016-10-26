<?php


/**
 * Description of EmpGradeLevel
 *
 * @author Adeleke Oladapo
 */
class EmpGradeLevel {
    
    private $table_name = 'tb_employee_grade_level';
    
    function insertEmpGradeLevel($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getEmpGradeLevels(){
        $this->db->select('*');
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getEmpGradeLevel($id){
        $this->db->select('*');
        $this->db->where('employee_grade_level_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
}
