<?php
/**
 * Description of ExaminationModel
 *
 * @author Dolapo
 */
class ExaminationModel extends CI_Model {
    
    private $table_name = 'tb_examination', $table_exam_timetable = 'tb_examination_timetable', $table_exam_group = 'tb_examination_group';
    
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
    
    /** Examination Group **/
    function insertExaminationGroup($data){
        if($this->getExaminationGroup($data->examination_group_id)){
            $this->updateExaminationGroup($data);
        }else{
            $this->db->insert($this->table_exam_group, $data);
            return $this->db->insert_id();
        }
    }
    
    function getExaminationGroup($id){
        $this->db->select('*');
        $this->db->where('examination_group_id', $id);
        $query = $this->db->get($this->table_exam_group);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    function updateExaminationGroup($data){
        $this->db->where('examination_group_id', $data->examination_group_id);
        $this->db->update($this->table_exam_group, $data);
    }
    
    function getExamGroups($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_exam_group);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
}
