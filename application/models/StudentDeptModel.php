<?php


/**
 * Description of EmployeeDeptModel
 *
 * @author Adeleke Oladapo
 */
class StudentDeptModel {
    
    private $table_name = 'tb_student_department';
    
    function insertStudentDept($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getStudentDepts(){
        $this->db->select('*');
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getStudentDept($id){
        $this->db->select('*');
        $this->db->where('student_department_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
}
