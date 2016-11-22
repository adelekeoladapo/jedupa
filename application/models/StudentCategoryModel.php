<?php


/**
 * Description of StudentCategoryModel
 *
 * @author Adeleke Oladapo
 */
class StudentCategoryModel extends CI_Model {
    
    private $table_name = 'tb_student_category';
    
    function insertStudentCategory($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getStudentCategories($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = 25){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getStudentCategory($id){
        $this->db->select('*');
        $this->db->where('class_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
}
