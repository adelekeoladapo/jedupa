<?php


/**
 * Description of QuotaModel
 *
 * @author Adeleke Oladapo
 */
class ClassModel extends CI_Model {
    
    private $table_name = 'tb_class', $view_name = 'vw_class', $tb_level = 'tb_class_level';
    
    function insertClass($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getClasses($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = 25){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->view_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getClass($id){
        $this->db->select('*');
        $this->db->where('class_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    /** class level **/
    function insertLevel($data){
        $this->db->insert($this->tb_level, $data);
        return $this->db->insert_id();
    }
    
    function getLevels($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->tb_level);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getLevel($id){
        $this->db->select('*');
        $this->db->where('class_id', $id);
        $query = $this->db->get($this->tb_level);
        return ($query->num_rows()) ? $query->row() : null;
    }
    /** end class level **/
    
}
