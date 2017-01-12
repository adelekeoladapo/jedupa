<?php

/**
 * Description of GradingLevelModel
 *
 * @author Adeleke Oladapo
 */

class GradingLevelModel extends CI_Model {
    
    private $table_name = 'tb_grading_level', $table_grading_level_structure = 'tb_grading_level_structure';
    
    function insertGradingLevel($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getGradingLevels($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getGradingLevel($id){
        $this->db->select('*');
        $this->db->where('grading_level_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    /** Score Group Structure **/
    function insertGradingLevelStructure($data){
        $this->db->insert($this->table_grading_level_structure, $data);
        return $this->db->insert_id();
    }
    
    function getGradingLevelStructures($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_grading_level_structure);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getGradingLevelStructure($id){
        $this->db->select('*');
        $this->db->where('score_group_id', $id);
        $query = $this->db->get($this->table_grading_level_structure);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
}
