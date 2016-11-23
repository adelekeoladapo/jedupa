<?php

/**
 * Description of EmpPositionModel
 *
 * @author Adeleke Oladapo
 */
class EmpPositionModel extends CI_Model {
    
    private $table_name = 'tb_employee_position', $view_emp_position = 'vw_employee_position';
    
    function insertEmpPosition($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getEmpPosition($id){
        $this->db->select('*');
        $this->db->where('employee_position_id', $id);
        $query = $this->db->get($this->view_emp_position);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    function getEmpPositions($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->view_emp_position);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
}
