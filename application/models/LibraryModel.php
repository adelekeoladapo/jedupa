<?php

/**
 * Description of LibraryModel
 *
 * @author Adeleke Oladapo
 */

class LibraryModel extends CI_Model {
    
    private $table_book = 'tb_book', $table_author = 'tb_author', $table_publisher = 'tb_publisher', $table_book_category = 'tb_book_category', $table_book_genre = 'tb_book_genre';
    
    
    /************** Book *************/
    
    function insertBook($data){
        $this->db->insert($this->table_book, $data);
        return $this->db->insert_id();
    }
    
    function getBook($id){
        $this->db->select('*');
        $this->db->where('book_id', $id);
        $query = $this->db->get($this->table_book);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    function updateBook($data){
        $this->db->where('book_id', $data->book_id);
        return $this->db->update($this->table_book, $data);
    }
    
    function getBooks($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = 25){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_book);
        return ($query->num_rows()) ? $query->result() : null;
    }
    
    /************ End Book ***************/
    
    
    /************** Author *************/
    
    function insertAuthor($data){
        $this->db->insert($this->table_author, $data);
        return $this->db->insert_id();
    }
    
    function getAuthor($id){
        $this->db->select('*');
        $this->db->where('author_id', $id);
        $query = $this->db->get($this->table_author);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    function updateAuthor($data){
        $this->db->where('author_id', $data->author_id);
        return $this->db->update($this->table_author, $data);
    }
    
    function getAuthors($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = 25){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_author);
        return ($query->num_rows()) ? $query->result() : null;
    }
    
    /************ End Author ***************/
    
    
    /************** Publisher *************/
    
    function insertPublisher($data){
        $this->db->insert($this->table_publisher, $data);
        return $this->db->insert_id();
    }
    
    function getPublisher($id){
        $this->db->select('*');
        $this->db->where('publisher_id', $id);
        $query = $this->db->get($this->table_publisher);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    function updatePublisher($data){
        $this->db->where('publisher_id', $data->publisher_id);
        return $this->db->update($this->table_publisher, $data);
    }
    
    function getPublishers($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_publisher);
        return ($query->num_rows()) ? $query->result() : null;
    }
    
    /************ End Publisher ***************/
    
    
    /*********** SETTINGS ***********/
    
    function insertBookCategory($data){
        $this->db->insert($this->table_book_category, $data);
        return $this->db->insert_id();
    }
    
    function getBookCategories($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_book_category);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    
    function insertBookGenre($data){
        $this->db->insert($this->table_book_genre, $data);
        return $this->db->insert_id();
    }
    
    function getBookGenres($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_book_genre);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    /*********** SETTINGS ***********/
    
}
