<?php

class User extends CI_Controller {
    
    function __construct() {
        parent::__construct();
    }
    
    function login(){
        $data['error'] = '';
        $this->load->view('login', $data);
    }
    
}
