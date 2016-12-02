<?php


/**
 * Description of StudentCategoryModel
 *
 * @author Adeleke Oladapo
 */
class AdditionalFieldModel extends CI_Model {
    
    private $table_name = 'tb_user_additional_details', $table_additional_field = 'tb_user_additional_field', $view_additional_details = 'vw_additional_details';
    
    function insertAdditionalDetail($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getAdditionalDetails($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = 25){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getAdditionalDetail($id){
        $this->db->select('*');
        $this->db->where('class_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    function getUserAdditionalDetails($user_id, $user_group_type){
        $data = array('user_id' => $user_id, 'type' => $user_group_type);
        $this->db->select('*');
        $this->db->where($data);
        $query = $this->db->get($this->view_additional_details);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    /*
     * Additional Fields
     */
    function insertAdditionalField($data){
        $this->db->insert($this->table_additional_field, $data);
        return $this->db->insert_id();
    }
    
    function getAdditionalFields($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = 25){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_additional_field);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getAdditionalField($id){
        $this->db->select('*');
        $this->db->where('additional_field_id', $id);
        $query = $this->db->get($this->table_additional_field);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
}
