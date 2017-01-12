<?php

/**
 * Description of GradingLevelModel
 *
 * @author Adeleke Oladapo
 */

class ClassDesignationModel extends CI_Model {
    
    private $table_name = 'tb_class_designation', $table_class_designation_structure = 'tb_class_designation_structure';
    
    function insertClassDesignation($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getClassDesignations($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getClassDesignation($id){
        $this->db->select('*');
        $this->db->where('class_designation_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    /** Class Designation Structure **/
    function insertClassDesignationStructure($data){
        $this->db->insert($this->table_class_designation_structure, $data);
        return $this->db->insert_id();
    }
    
    function getClassDesignationStructures($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_class_designation_structure);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getClassDesignationStructure($id){
        $this->db->select('*');
        $this->db->where('class_designation_structure_id', $id);
        $query = $this->db->get($this->table_class_designation_structure);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
}
