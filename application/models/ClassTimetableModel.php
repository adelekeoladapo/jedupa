<?php


/**
 * Description of ClassTimetableModel
 *
 * @author Adeleke Oladapo
 */
class ClassTimetableModel extends CI_Model {
    
    private $table_name = 'tb_class_timetable', $view_name = 'vw_class_timetable';
    
    function insertClassTimetable($data){
        if($this->getClassTimetable_($data->weekday_id, $data->class_period_id)){
            $this->updateClassTimetable($data);
        }else{
            $this->db->insert($this->table_name, $data);
            return $this->db->insert_id();
        }
    }
    
    function updateClassTimetable($data){
        $this->db->where('weekday_id', $data->weekday_id);
        $this->db->where('class_period_id', $data->class_period_id);
        $this->db->update($this->table_name, $data);
    }
    
    function removeClassTimetablePeriod($data){
        $this->db->where('weekday_id', $data->weekday_id);
        $this->db->where('class_period_id', $data->class_period_id);
        $this->db->delete($this->table_name);
    }
    
    function getClassTimetable_($weekday_id, $class_period_id){
        $this->db->where('weekday_id', $weekday_id);
        $this->db->where('class_period_id', $class_period_id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : false;
    }
    
    function getClassTimetables($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->view_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    /** reset timetable for a class **/
    function clearClassTimetable($class_id){
        $this->db->where('class_id', $class_id);
        $this->db->delete($this->table_name);
    }
    
    /** reset weekday timetable for a class **/
    function clearWeekdayClassTimetable($class_id, $weekday_id){
        $this->db->where('class_id', $class_id);
        $this->db->where('weekday_id', $weekday_id);
        $this->db->delete($this->table_name);
    }
    
}
