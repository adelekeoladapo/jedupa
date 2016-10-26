<?php

/**
 * Description of State
 *
 * @author Adeleke Oladapo
 */
class State extends CI_Controller {
    
    private $model;
    
    function __construct() {
        parent::__construct();
        $this->load->model('StateModel');
        $this->model = new StateModel();
    }
    
    function getStates(){
        echo json_encode($this->model->getStates());
    }
    
    function getState(){
        $id = $this->input->post('state-id');
        echo json_encode($this->model->getState($id));
    }
    
}
