<?php


/**
 * Description of EmployeeDeptModel
 *
 * @author Adeleke Oladapo
 */
class EmpDeptModel {
    
    private $table_name = 'tb_employee_department';
    
    function insertEmpDept($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getEmpDepts(){
        $this->db->select('*');
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getEmpDept($id){
        $this->db->select('*');
        $this->db->where('employee_department_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
}
