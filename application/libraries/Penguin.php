<?php

class Penguin {
    
    function getTime(){
        return date_format(new DateTime('now'), "Y-m-d H:i:s");
    }
    
    function getSlug($str){
        return url_title($str, 'dash', TRUE);
    }
    
    function formatDate_1($date){
        return date_format(new DateTime($date), 'M j, Y');
    }
    
    function formatDate_2($date){
        return date_format(new DateTime($date), 'M j');
    }
    
    function prepareSlug($slug_id){
        $split = explode("-", $slug_id);
        $str = new stdClass();
        $slug = "";
        for($i = 0; $i < count($split)-1; $i++){
            $slug .= $split[$i]."-";
        }
        $str->id = $split[count($split)-1];
        $str->slug = substr($slug, 0, -1);
        return $str;
    }
    
    function prependZeros($num, $desired_length){
        if(strlen($num) >= $desired_length)
            return $num;
        
        for($i = 0; $i < ($desired_length - strlen($num)); $i++){
            $num = "0".$num;
        }
        return $num;
    }
    
}
