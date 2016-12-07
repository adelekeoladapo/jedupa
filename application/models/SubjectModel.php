<?php


/**
 * Description of QuotaModel
 *
 * @author Adeleke Oladapo
 */
class SubjectModel extends CI_Model {
    
    private $table_name = 'tb_subject';
    
    function insertSubject($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getSubjects($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = 25){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
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
