<?php


/**
 * Description of ClassTimetableModel
 *
 * @author Adeleke Oladapo
 */
class ClassTimetableModel extends CI_Model {
    
    private $table_name = 'tb_class_timetable', $view_name = '';
    
    function insertClassTimetable($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
}
