<?php


/**
 * Description of ClassTimetableModel
 *
 * @author Adeleke Oladapo
 */
class ClassTimetableModel extends CI_Model {
    
    private $table_name = 'tb_class_timetable', $view_name = 'vw_class_timetable';
    
    function insertClassTimetable($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getClassTimetables($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->view_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
}
