<?php

/**
 * Description of RemarkModel
 *
 * @author Adeleke Oladapo
 */

class RemarkModel extends CI_Model {
    
    private $table_name = 'tb_remark';
    
    function insertRemark($data){
        if($this->getRemarks_($data->class_id, $data->quota_id, $data->student_id, $data->type)){
            return $this->updateRemark_($data);
        }else{
            $this->db->insert($this->table_name, $data);
            return $this->db->insert_id();
        }
    }
    
    function getRemark($id){
        $this->db->select('*');
        $this->db->where('remark_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    function updateRemark($data){
        $this->db->where('remark_id', $data->remark_id);
        return $this->db->update($this->table_name, $data);
    }
    
    function updateRemark_($data){
        $this->db->where('class_id', $data->class_id);
        $this->db->where('quota_id', $data->quota_id);
        $this->db->where('student_id', $data->student_id);
        $this->db->where('type', $data->type);
        return $this->db->update($this->table_name, $data);
    }
    
    function getRemarks($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = 25){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getRemarks_($class_id, $quota_id, $student_id, $type){
        $this->db->select('*');
        $this->db->where('class_id', $class_id);
        $this->db->where('quota_id', $quota_id);
        $this->db->where('student_id', $student_id);
        $this->db->where('type', $type);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : false;
    }
    
    function getClassQuotaRemarks($class_id, $quota_id){
        $this->db->select('*');
        $this->db->where('class_id', $class_id);
        $this->db->where('quota_id', $quota_id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : false;
    }
    
}
