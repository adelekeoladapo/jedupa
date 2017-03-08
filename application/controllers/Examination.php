<?php

class Examination extends CI_Controller {
    
    private $model, $quota_model;
    
    function __construct() {
        parent::__construct();
        $this->load->model('ExaminationModel');
        $this->model = new ExaminationModel();
    }
    
    function addExamination(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        $data->date_created = $this->penguin->getTime();
        echo $this->model->insertExamination($data);
    }
    
    function getExaminations(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page = $this->input->get('page');
        $page_size = $this->input->get('page-size');
        echo json_encode($this->model->getExaminations($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
    function updateExamination(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        echo $this->model->updateExamination($data);
    }
    
    /** Create Class Examination Timetable **/
    
    function createClassExamTimetable(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        $timetable = new stdClass();
        $timetable->school_id = $data->examination->school_id;
        $timetable->session_id = $data->examination->session_id;
        $timetable->quota_id = $data->examination->quota_id;
        $timetable->examination_id = $data->examination->examination_id;
        foreach ($data->timetable as $tt) {
            $timetable->subject_id = $tt->subject_id;
            $timetable->max_score = $tt->max_score;
            $timetable->start_time = $tt->start_time;
            $timetable->end_time = $tt->end_time;
            $timetable->subject = $tt->subject;
            $this->model->insertExaminationTimetable($timetable);
        }
    }
    
    function addExaminationTimetable(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        $data->date_created = $this->penguin->getTime();
        echo $this->model->insertExaminationTimetable($data);
    }
    
    function getExamTimetables(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page = $this->input->get('page');
        $page_size = $this->input->get('page-size');
        
        $quota = json_decode($this->input->get('quota'));
        
        echo json_encode($this->model->getExaminationTimetables($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size, $quota));
    }
    
    function connectExaminations(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        foreach ($data->exams as $exam) {
            $this->model->updateExamination($exam);
        }
        $exam_group = new stdClass();
        $exam_group->grading_level_id = $data->grading_level_id;
        $exam_group->class_designation_id = $data->class_designation_id;
        $exam_group->class_id = $data->class_id;
        $exam_group->quota_id = $data->quota_id;
        $exam_group->school_id = $data->school_id;
        $exam_group->examination_group_id = $data->examination_group_id;
        $this->model->insertExaminationGroup($exam_group);
        echo 'connected';
    }
    
    function getExaminationGroups(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page = $this->input->get('page');
        $page_size = $this->input->get('page-size');
        echo json_encode($this->model->getExamGroups($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size));
    }
    
    
    
    
    /** Continuous Assessment **/
    
    function addContinuousAssessment(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        echo $this->model->insertContinuousAssessment($data);
    }
    
    function getContinuousAssessments(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page = $this->input->get('page');
        $page_size = $this->input->get('page-size');
        
        $quota = json_decode($this->input->get('quota'));
        
        echo json_encode($this->model->getContinuousAssessments($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size, $quota));
    }
    
    function saveContinuousAssessment(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        
        $c_a = new stdClass();
        $c_a->school_id = $data->school_id;
        $c_a->session_id = $data->session_id;
        $c_a->quota_id = $data->quota_id;
        $c_a->class_id = $data->class_id;
        
        $c_a->subjects = $data->subjects;
        
        foreach ($c_a->subjects as $subject) {
            $c_a->subject_id = $subject->subject_id;
            $students = (isset($subject->students)) ? $subject->students : false;
            if($students){
                foreach ($students as $student) {
                    $c_a->student_id = $student->student_id;
                    $examinations = $student->examinations;
                    foreach ($examinations as $examination) {
                        $c_a->examination_id = $examination->examination_id;
                        $c_a->continuous_assessment_id = (isset($examination->continuous_assessment_id)) ? $examination->continuous_assessment_id : false;
                        $c_a->score = (isset($examination->score) && $examination->score > -1) ? $examination->score : false;
                        if($c_a->score)
                            $this->model->insertContinuousAssessment($c_a);
                    }
                }
            }
        }
        
        return;
        
        
        
        
        $ca_data = $data->data;
        
        foreach ($ca_data as $d) {
            $c_a->student_id = $d->student_id;
            $ca_data_exams = $d->examinations;
            
            foreach($ca_data_exams as $exam){
                $c_a->continuous_assessment_id = (isset($exam->continuous_assessment_id)) ? $exam->continuous_assessment_id : 0;
                
                $c_a->examination_id = $exam->examination_id;
                
                $c_a->score = (isset($exam->score)) ? $exam->score : 0;
                    
                $this->model->insertContinuousAssessment($c_a);
            }
            
        }
        
    }
    
    function getClassQuotaContinuousAssessment(){
        $sort_field = $this->input->get('sort-field');
        $sort_order_mode = $this->input->get('sort-order-mode');
        $filter_field = $this->input->get('filter-field');
        $filter_value = $this->input->get('filter-value');
        $page = $this->input->get('page');
        $page_size = $this->input->get('page-size');
        
        $quota = json_decode($this->input->get('quota'));
        
        $class_id = $this->input->get('class-id');
        
        echo json_encode($this->model->getContinuousAssessments($sort_field, $sort_order_mode, $filter_field, $filter_value, $page, $page_size, $quota, $class_id));
    }
    
    /* returns rhe sum of each student's quota's subject examination scores */
    function getClassQuotaSubjectsContinuousAssesssmentsSums(){
        $class_id = $this->input->get('class-id');
        $quota_id = $this->input->get('quota-id');
        $school_id = $this->input->get('school-id');
        $dd = $this->model->getClassQuotaSubjectsContinuousAssesssmentsSums($school_id, $class_id, $quota_id);
        echo json_encode($dd);
    }
    
    function getClassQuotaBroadsheet(){
        $class_id = $this->input->get('class-id');
        $quota_id = $this->input->get('quota-id');
        $school_id = $this->input->get('school-id');
        $data = $this->model->getClassQuotaBroadSheet($school_id, $class_id, $quota_id);
        echo json_encode($data);
    }
    
    
    
    /** Class quota result settings **/
    function insertClassQuotaResultSettings(){
        $data = new stdClass();
        $data = json_decode(file_get_contents('php://input'));
        $this->model->insertQuotaClassResultSettings($data);
    }
    
    function getClassQuotaResultSettings(){
        $class_id = $this->input->get('class-id');
        $quota_id = $this->input->get('quota-id');
        $data = $this->model->getQuotaClassResultSettings_($quota_id, $class_id);
        echo json_encode($data);
    }
    
}
