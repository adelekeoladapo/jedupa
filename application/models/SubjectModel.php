<?php


/**
 * Description of QuotaModel
 *
 * @author Adeleke Oladapo
 */
class SubjectModel extends CI_Model {
    
    private $table_name = 'tb_subject', $table_basic_class_subject = 'tb_class_basic_subject', $view_basic_class_subject = 'vw_class_basic_subject';
    
    function insertSubject($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getSubjects($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
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
    
    /** Assign subject to class || insert class basic subject **/
    function insertClassBasicSubject($data){
        if($data->class_basic_subject_id){
            $this->updateClassBasicSubject($data);
        }else{
            $this->db->insert($this->table_basic_class_subject, $data);
            return $this->db->insert_id();
        }
    }
    
    function updateClassBasicSubject($data){
        $this->db->where('class_basic_subject_id', $data->class_basic_subject_id);
        $this->db->update($this->table_basic_class_subject, $data);
    }
    
    function getClassesBasicSubjects($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->view_basic_class_subject);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function deleteClassBasicSubject($id){
        $this->db->where('class_basic_subject_id', $id);
        $this->db->delete($this->table_basic_class_subject);
    }
    
}
