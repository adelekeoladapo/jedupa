<?php


class BehaviouralTraitModel extends CI_Model {
    
    private $table_psychometer = 'tb_psychometer', $table_effective_area = 'tb_effective_area', $table_user_psychomotor = 'tb_user_psychomotor', $table_user_effective_area = 'tb_user_effective_area';
    
    function insertPsychometer($data){
        $this->db->insert($this->table_psychometer, $data);
        return $this->db->insert_id();
    }
    
    function getPsychometers($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_psychometer);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getPsychometer($id){
        $this->db->select('*');
        $this->db->where('psychometer_id', $id);
        $query = $this->db->get($this->table_psychometer);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    function updatePsychometer($data){
        $this->db->where('psychomotor_id', $data->psychomotor_id);
        $this->db->update($this->table_psychometer, $data);
    }
    
    function insertUserPsychometer($data){
        if($this->getUserPsychometer_($data->student_id, $data->quota_id, $data->class_id, $data->psychomotor_id)){
            $this->updateUserPsychometer_($data);
        }else{
            $this->db->insert($this->table_user_psychomotor, $data);
            return $this->db->insert_id();
        }
    }
    
    function getUserPsychometer($user_psychometer_id){
        $this->db->select('*');
        $this->db->where('user_psychomotor_id', $user_psychometer_id);
        $query = $this->db->get($this->table_user_psychomotor);
        return ($query->num_rows()) ? $query->row() : false;
    }
    
    function updateUserPsychometer($data){
        $this->db->where('user_psychomotor_id', $data->user_psychometer_id);
        $this->db->update($this->table_user_psychomotor, $data);
    }
    
    function updateUserPsychometer_($data){
        $this->db->where('student_id', $data->student_id);
        $this->db->where('quota_id', $data->quota_id);
        $this->db->where('class_id', $data->class_id);
        $this->db->where('psychomotor_id', $data->psychomotor_id);
        $this->db->update($this->table_user_psychomotor, $data);
    }
    
    function getUserPsychometer_($student_id, $quota_id, $class_id, $psychomotor_id){
        $this->db->select('*');
        $this->db->where('student_id', $student_id);
        $this->db->where('quota_id', $quota_id);
        $this->db->where('class_id', $class_id);
        $this->db->where('psychomotor_id', $psychomotor_id);
        $query = $this->db->get($this->table_user_psychomotor);
        return ($query->num_rows()) ? $query->row() : false;
    }
    
    function getClassQuotaPsychometers($class_id, $quota_id){
        $this->db->select('*');
        $this->db->where('quota_id', $quota_id);
        $this->db->where('class_id', $class_id);
        $query = $this->db->get($this->table_user_psychomotor);
        return ($query->num_rows()) ? $query->result() : false;
    }
    
    
    ////// Effective Area //////////
    
    function insertEffectiveArea($data){
        $this->db->insert($this->table_effective_area, $data);
        return $this->db->insert_id();
    }
    
    function getEffectiveAreas($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_effective_area);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getEffectiveArea($id){
        $this->db->select('*');
        $this->db->where('psychometer_id', $id);
        $query = $this->db->get($this->table_effective_area);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    function updateEffectiveArea($data){
        $this->db->where('effective_area_id', $data->effective_area_id);
        $this->db->update($this->table_effective_area, $data);
    }
    
    function insertUserEffectiveArea($data){
        if($this->getUserEffectiveArea_($data->student_id, $data->quota_id, $data->class_id, $data->effective_area_id)){
            $this->updateUserEffectiveArea_($data);
        }else{
            $this->db->insert($this->table_user_effective_area, $data);
            return $this->db->insert_id();
        }
    }
    
    function getUserEffectiveArea($user_effective_area_id){
        $this->db->select('*');
        $this->db->where('user_effective_area_id', $user_effective_area_id);
        $query = $this->db->get($this->table_user_effective_area);
        return ($query->num_rows()) ? $query->row() : false;
    }
    
    function updateUserEffectiveArea($data){
        $this->db->where('user_effective_area_id', $data->user_effective_area_id);
        $this->db->update($this->table_user_effective_area, $data);
    }
    
    function updateUserEffectiveArea_($data){
        $this->db->where('student_id', $data->student_id);
        $this->db->where('quota_id', $data->quota_id);
        $this->db->where('class_id', $data->class_id);
        $this->db->where('effective_area_id', $data->effective_area_id);
        $this->db->update($this->table_user_effective_area, $data);
    }
    
    function getUserEffectiveArea_($student_id, $quota_id, $class_id, $effective_area_id){
        $this->db->select('*');
        $this->db->where('student_id', $student_id);
        $this->db->where('quota_id', $quota_id);
        $this->db->where('class_id', $class_id);
        $this->db->where('effective_area_id', $effective_area_id);
        $query = $this->db->get($this->table_user_effective_area);
        return ($query->num_rows()) ? $query->row() : false;
    }
    
    function getClassQuotaEffectiveAreas($class_id, $quota_id){
        $this->db->select('*');
        $this->db->where('quota_id', $quota_id);
        $this->db->where('class_id', $class_id);
        $query = $this->db->get($this->table_user_effective_area);
        return ($query->num_rows()) ? $query->result() : false;
    }
    
}
