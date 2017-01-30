<?php

/**
 * 
 * Description of UserPrivilegeModel
 *
 * @author Adeleke Oladapo
 */

class UserPrivilegeModel extends CI_Model {
    
    private $table_name = 'tb_user_privilege', $table_module = 'tb_module', $table_user_privilege_module = 'tb_user_privilege_module', $view_user_privilege_module = 'vw_user_privilege_module';
    
    function insertUserPrivilege($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getUserPrivileges($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getUserPrivilege($id){
        $this->db->select('*');
        $this->db->where('user_privilege_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    /** Modules **/
    function insertModule($data){
        $this->db->insert($this->table_module, $data);
        return $this->db->insert_id();
    }
    
    function getModules($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_module);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getModule($id){
        $this->db->select('*');
        $this->db->where('module_id', $id);
        $query = $this->db->get($this->table_module);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    
    
    /** User Privilege Modules **/
    
    function insertUserPrivilegeModule($data){
        if($this->getUserPrivilegeModule($data->user_privilege_module_id)){
            $this->updateUserPrivilegeModule($data);
        }else{
            $this->db->insert($this->table_user_privilege_module, $data);
            return $this->db->insert_id();
        }
    }
    
    function updateUserPrivilegeModule($data){
        $this->db->where('user_privilege_module_id', $data->user_privilege_module_id);
        $this->db->update($this->table_user_privilege_module, $data);
    }
    
    function getUserPrivilegeModules($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->view_user_privilege_module);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getUserPrivilegeModule($id){
        $this->db->select('*');
        $this->db->where('user_privilege_module_id', $id);
        $query = $this->db->get($this->table_user_privilege_module);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
}
