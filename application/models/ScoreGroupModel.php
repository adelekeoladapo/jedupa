<?php

/**
 * Description of ScoreGroup
 *
 * @author Adeleke Oladapo
 */

class ScoreGroupModel extends CI_Model {
    
    private $table_name = 'tb_score_group', $table_score_group_structure = 'tb_score_group_structure';
    
    function insertScoreGroup($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getScoreGroups($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getScoreGroup($id){
        $this->db->select('*');
        $this->db->where('score_group_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    /** Score Group Structure **/
    function insertScoreGroupStructure($data){
        $this->db->insert($this->table_score_group_structure, $data);
        return $this->db->insert_id();
    }
    
    function getScoreGroupStructures($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_score_group_structure);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getScoreGroupStructure($id){
        $this->db->select('*');
        $this->db->where('score_group_id', $id);
        $query = $this->db->get($this->table_score_group_structure);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
}
