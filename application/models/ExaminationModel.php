<?php
/**
 * Description of ExaminationModel
 *
 * @author Dolapo
 */
class ExaminationModel extends CI_Model {
    
    private $table_name = 'tb_examination', $table_exam_timetable = 'tb_examination_timetable';
    
    function insertExamination($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getExaminations($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getExamination($id){
        $this->db->select('*');
        $this->db->where('examination_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    function updateExamination($data){
        $this->db->where('examination_id', $data->examination_id);
        $this->db->update($this->table_name, $data);
    }
    
    /** Class Examination Timetable **/
    function insertExaminationTimetable($data){
        $this->db->insert($this->table_exam_timetable, $data);
        return $this->db->insert_id();
    }
    
    function getExaminationTimetables($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_exam_timetable);
        return ($query->num_rows()) ? $query->result() : [];
    }
}
