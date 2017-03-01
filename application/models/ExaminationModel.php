<?php
/**
 * Description of ExaminationModel
 *
 * @author Dolapo
 */
class ExaminationModel extends CI_Model {
    
    private $table_name = 'tb_examination', $table_exam_timetable = 'tb_examination_timetable', $table_exam_group = 'tb_examination_group', $table_continuous_assessment = 'tb_continuous_assessment', $view_broadsheet = 'vw_broadsheet';
    
    function insertExamination($data){
        $this->db->insert($this->table_name, $data);
        return $this->db->insert_id();
    }
    
    function getExaminations($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function getExamination($id){
        $this->db->select('*');
        $this->db->where('examination_id', $id);
        $query = $this->db->get($this->table_name);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    function updateExamination($data){
        $this->db->where('examination_id', $data->examination_id);
        $this->db->update($this->table_name, $data);
    }
    
    /** Class Examination Timetable **/
    function insertExaminationTimetable($data){
        $this->db->insert($this->table_exam_timetable, $data);
        return $this->db->insert_id();
    }
    
    function getExaminationTimetables($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false, $quota = false){
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        
        if($quota){
            $this->db->where('quota_id', $quota->quota_id);
        }
        
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_exam_timetable);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    /** Examination Group **/
    function insertExaminationGroup($data){
        if($this->getExaminationGroup($data->examination_group_id)){
            $this->updateExaminationGroup($data);
        }else{
            $this->db->insert($this->table_exam_group, $data);
            return $this->db->insert_id();
        }
    }
    
    function getExaminationGroup($id){
        $this->db->select('*');
        $this->db->where('examination_group_id', $id);
        $query = $this->db->get($this->table_exam_group);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    function updateExaminationGroup($data){
        $this->db->where('examination_group_id', $data->examination_group_id);
        $this->db->update($this->table_exam_group, $data);
    }
    
    function getExamGroups($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false){
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_exam_group);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    
    
    /** Continuous Assessment **/
    
    function insertContinuousAssessment($data){
        if($this->getContinuousAssessment($data->continuous_assessment_id) || $this->getContinuousAssessment_($data->quota_id, $data->class_id, $data->examination_id, $data->student_id, $data->subject_id)){
            $this->updateContinuousAssessment($data);
            return;
        }
        $this->db->insert($this->table_continuous_assessment, $data);
        return $this->db->insert_id();
    }
    
    function getContinuousAssessments($sort_field = false, $sort_order_mode = false, $filter_field = false, $filter_value = false, $page = false, $page_size = false, $quota = false, $class_id = false){ 
        $this->db->select('*');
        $this->db->order_by($sort_field, $sort_order_mode);
        ($filter_value) ? $this->db->where($filter_field, $filter_value) : '';
        
        if($quota){
            $this->db->where('quota_id', $quota->quota_id);
        }
        
        if($class_id){
            $this->db->where('class_id', $class_id);
        }
        
        ($page) ? $this->db->limit($page_size, $page) : $this->db->limit($page_size);
        $query = $this->db->get($this->table_continuous_assessment);
        return ($query->num_rows()) ? $query->result() : [];
    }
    
    function updateContinuousAssessment($data){
        $this->db->where('continuous_assessment_id', $data->continuous_assessment_id);
        $this->db->update($this->table_continuous_assessment, $data);
    }
    
    function getContinuousAssessment($id){
        $this->db->where('continuous_assessment_id', $id);
        $query = $this->db->get($this->table_continuous_assessment);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    function getContinuousAssessment_($quota_id, $class_id, $exam_id, $student_id, $subject_id){
        $this->db->where('quota_id', $quota_id);
        $this->db->where('class_id', $class_id);
        $this->db->where('examination_id', $exam_id);
        $this->db->where('student_id', $student_id);
        $this->db->where('subject_id', $subject_id);
        $query = $this->db->get($this->table_continuous_assessment);
        return ($query->num_rows()) ? $query->row() : null;
    }
    
    function deleteContinuousAssessment($id){
        $this->db->where('continuous_assessment_id', $id);
        $query = $this->db->delete($this->table_continuous_assessment);
    }
    
    function getClassQuotaSubjectsContinuousAssesssmentsSums($school_id, $class_id, $quota_id){
        $query = $this->db->query('SELECT tb_continuous_assessment.continuous_assessment_id, tb_continuous_assessment.school_id,tb_continuous_assessment.session_id,tb_continuous_assessment.student_id,tb_continuous_assessment.subject_id,SUM(tb_continuous_assessment.score)AS total_score FROM tb_continuous_assessment WHERE tb_continuous_assessment.quota_id = '.$quota_id.' AND tb_continuous_assessment.class_id = '.$class_id.' AND tb_continuous_assessment.school_id = '.$school_id.' GROUP BY tb_continuous_assessment.subject_id, tb_continuous_assessment.student_id ORDER BY tb_continuous_assessment.student_id');
        return ($query->num_rows()) ? $query->result() : null;
    }
    
    function getClassQuotaBroadSheet($school_id, $class_id, $quota_id){
        $this->db->where('quota_id', $quota_id);
        $this->db->where('class_id', $class_id);
        $this->db->where('school_id', $school_id);
        $this->db->order_by('total_score', 'DESC');
        $query = $this->db->get($this->view_broadsheet);
        $data = ($query->num_rows()) ? $query->result() : false;
        if($data){
            //get an array of total_score
            $total_scores = [];
            foreach ($data as $d){
                array_push($total_scores, $d->total_score);
            }
            
            $broadsheet = [];
            foreach ($data as $d){
                $position = $this->penguin->getPosition($d->total_score, $total_scores);
                
                $last_char = substr($position, -1);
                
                if($last_char == '1')
                    $position .= 'st';
                elseif($last_char == '2')
                    $position .= 'nd';
                elseif($last_char == '3')
                    $position .= 'rd';
                else
                    $position .= 'th';
                
                $d->position = $position;
                array_push($broadsheet, $d);
            }
            return $broadsheet;
        }else{
            return false;
        }
    }
    
}
