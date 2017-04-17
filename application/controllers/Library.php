<?php

/**
 * Description of Library
 *
 * @author Adeleke Oladapo
 */
class Library extends CI_Controller {
    
    private $model;
    
    function __construct() {
        parent::__construct();
        $this->load->model('LibraryModel');
        $this->model = new LibraryModel();
    }
    
    
    /******** Book ********/
    
    function addBook(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        echo $this->model->insertBook($data);
    }
    
    function getBook(){
        $book_id = $this->input->get('book-id');
        echo json_encode($this->model->getBook($book_id));
    }
    
    function getBooks(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page = $this->input->get('page');
        $page_size = $this->input->get('page-size');
        echo json_encode($this->model->getBooks($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
    /******** End Book ********/
    
    
    /******** Author ********/
    
    function addAuthor(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        echo $this->model->insertAuthor($data);
    }
    
    function getAuthor(){
        $author_id = $this->input->get('author-id');
        echo json_encode($this->model->getAuthor($author_id));
    }
    
    function getAuthors(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page = $this->input->get('page');
        $page_size = $this->input->get('page-size');
        echo json_encode($this->model->getAuthors($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
    /******** End Author ********/
    
    
    /******** Publisher ********/
    
    function addPublisher(){
        $data = new stdClass();
        
        $data->school_id = $this->input->post('school-id');
        
        /** Upload Logo **/
        $image = $this->upload->upload_image('photo', $data->school_id);
        if($image->status){
            $data->photo = $image->message['file_name'];
        }else{
            if($image->message == '<p>You did not select a file to upload.</p>'){
                
            }else{
                echo json_encode($image);
                return;
            }
        }
        
        $data->name = $this->input->post('name'); 
        $data->email = $this->input->post('email'); 
        $data->website = $this->input->post('website'); 
        $data->phone = $this->input->post('phone'); 
        $data->address = $this->input->post('address'); 
        
        $this->model->insertPublisher($data);
        
        echo json_encode(array('status' => true, 'message' => 'Successfully Submitted'));
    }
    
    function updatePublisher(){
        $data = new stdClass();
        
        $data->school_id = $this->input->post('school-id');
        
        /** Upload Logo **/
        $image = $this->upload->upload_image('photo', $data->school_id);
        if($image->status){
            $data->photo = $image->message['file_name'];
        }else{
            if($image->message == '<p>You did not select a file to upload.</p>'){
                
            }else{
                echo json_encode($image);
                return;
            }
        }
        
        $data->publisher_id = $this->input->post('publisher-id');
        $data->name = $this->input->post('name'); 
        $data->email = $this->input->post('email'); 
        $data->website = $this->input->post('website'); 
        $data->phone = $this->input->post('phone'); 
        $data->address = $this->input->post('address'); 
        
        $this->model->updatePublisher($data);
        
        echo json_encode(array('status' => true, 'message' => 'Successfully Updated'));
    }
    
    function getPublisher(){
        $publisher_id = $this->input->get('publisher-id');
        echo json_encode($this->model->getPublisher($publisher_id));
    }
    
    function getPublishers(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page = $this->input->get('page');
        $page_size = $this->input->get('page-size');
        echo json_encode($this->model->getPublishers($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
    /******** End Author ********/
    
}
