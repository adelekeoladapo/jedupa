<?php

/**
 * Description of Subject
 *
 * @author Adeleke Oladapo
 */
class Subject extends CI_Controller {
    
    private $model;
    
    function __construct() {
        parent::__construct();
        $this->load->model('SubjectModel');
        $this->model = new SubjectModel();
    }
    
    function addSubject(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        $data->date_created = $this->penguin->getTime();
        echo $this->model->insertSubject($data);
    }
    
    function getSubjects(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page_size = $this->input->get('page-size');
        $page = $this->input->get('page');
        echo json_encode($this->model->getSubjects($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
    /** Assign subjects to class **/
    function assignClassSubjects(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        $data->date_created = $this->penguin->getTime();
        $subject_ids = $data->subject_ids;
        unset($data->subject_ids);
        foreach ($subject_ids as $subject_id) {
            $data->subject_id = $subject_id;
            $this->model->insertClassBasicSubject($data);
        }
    }
    
    function assignClassSubject(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        $data->date_created = $this->penguin->getTime();
        echo $this->model->insertClassBasicSubject($data);
    }
    
}
