<?php

/**
 * Description of Remark
 *
 * @author Adeleke Oladapo
 */
class Remark extends CI_Controller {
    
    private $model;
    
    function __construct() {
        parent::__construct();
        $this->load->model('RemarkModel');
        $this->model = new RemarkModel();
    }
    
    function addRemark(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        echo $this->model->insertRemark($data);
    }
    
    function getClassQuotaRemarks(){
        $class_id = $this->input->get('class-id');
        $quota_id = $this->input->get('quota-id');
        echo json_encode($this->model->getClassQuotaRemarks($class_id, $quota_id));
    }
    
    function getRemarks(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page = $this->input->get('page');
        $page_size = $this->input->get('page-size');
        echo json_encode($this->model->getRemarks($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
    
}
