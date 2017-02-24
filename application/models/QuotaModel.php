<?php


/**
 * Description of QuotaModel
 *
 * @author Adeleke Oladapo
 */
class QuotaModel extends CI_Model {
    
    private $table_name = 'tb_quota', $view_name = 'vw_quota';
    
    function insertQuota($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getQuotas($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->view_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getQuota($id){
        $this->db->select('*');
        $this->db->where('quota_id', $id);
        $query = $this->db->get($this->view_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    function updateQuota($data){
        $this->db->where('quota_id', $data->quota_id);
        $this->db->update($this->table_name, $data);
    }
    
    function deactivateAllQuotas(){
        $this->db->set('is_active', 0);
        $this->db->update($this->table_name, $data);
    }
    
}
