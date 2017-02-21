<?php


/**
 * Description of ClassPeriodModel
 *
 * @author Adeleke Oladapo
 */
class ClassPeriodModel extends CI_Model {
    
    private $table_name = 'tb_class_period', $view_name = 'vw_class_period', $table_weekday_class_period = 'tb_weekday_class_period', $view_weekday_class_period = 'vw_weekday_class_period';
    
    function insertClassPeriod($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getClassPeriods($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->view_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getClassPeriod($id){
        $this->db->select('*');
        $this->db->where('class_period_id', $id);
        $query = $this->db->get($this->view_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    
    /******* Weekday Class Period **********/
    
    function insertWeekdayClassPeriod($data){
        $this->db->insert($this->table_weekday_class_period, $data);
        return $this->db->insert_id();
    }
    
    function getWeekdayClassPeriods($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false, $quota = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        
        if($quota){
            $this->db->where('session_id', $quota->session_id);
            $this->db->where('quota_id', $quota->quota_id);
        }
        
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->view_weekday_class_period);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getWeekdayClassPeriod($id){
        $this->db->select('*');
        $this->db->where('weekday_class_period_id', $id);
        $query = $this->db->get($this->view_weekday_class_period);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    function deleteWeekdayClassPeriod($id){
        $this->db->where('weekday_class_period_id', $id);
        $query = $this->db->delete($this->table_weekday_class_period);
    }
    
    function deleteWeekdayClassPeriod_($class_id, $weekday_id, $quota_id){
        $this->db->where('class_id', $class_id);
        $this->db->where('weekday_id', $weekday_id);
        $this->db->where('quota_id', $quota_id);
        $query = $this->db->delete($this->table_weekday_class_period);
    }
    
}
