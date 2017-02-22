app.controller('ExaminationCtrl', function($scope, $scope, Factory, Service, grading_levels, class_designations, class_types, sessions){
    
    $scope.factory = Factory;
    
    $scope.class_types = class_types.data;
    
    $scope.sessions = sessions.data;
    
    $scope.grading_levels = grading_levels.data;
    
    $scope.class_designations = class_designations.data;
    
    $scope.class_designation_structures = Factory.getClassDesignationStructures();
    
    $scope.grading_levels = Factory.getGradingLevels();
    
    $scope.grading_level_structures = Factory.getGradingLevelStructures();
    
    $scope.default_quota = $scope.$parent.default_quota;//Factory.getDefaultQuota();
    
    $scope.class_designation = {};
    
    $scope.class_designation_structure = {};
    
    $scope.grading_level = {};
    
    $scope.grading_level_structure = {};
    
    $scope.classs = {};
    
    $scope.examination_group = {};
    
    /** CLASS DESIGNATION **/
    
    /** add Class Designation **/
    $scope.addClassDesignation = function(){
        if($('#form-add-class-designation').smkValidate()){
            show_loading_overlay();
            $scope.class_designation.school_id = Factory.getSchoolID();
            Service.addClassDesignation($scope.class_designation).then(function(response){
                Service.getClassDesignations().then(function(response){
                    Factory.updateClassDesignations(response.data);
                    $scope.class_designations = response.data;
                    clear_form_fields('form-add-class-designation');
                    hide_loading_overlay();
                    toast('Class Designation Successfully Added');
                }, function(error){});
            }, function(error){
                console.log(error);
            });
        }
    }
    /** end add Class Designation **/
    
    /** set active Class Designation **/
    $scope.setActiveClassDesignation = function(class_designation_id){
        $scope.active_class_designation = Factory.getClassDesignation(class_designation_id);
        $scope.active_class_designation_structures = Factory.getClassDesignationStructures_(class_designation_id);
    }
    try{
        $scope.setActiveClassDesignation($scope.class_designations[0].class_designation_id);
    }catch(e){
        console.log(e.message);
    }
    /** end set active Class Designation **/
    
    /** add Class Designation structure **/
    $scope.show_add_class_designation_structure_overlay = function(){
        $('#add-class-designation-structure-overlay').show();
    }
    $scope.addClassDesignationStructure = function(){
        if($('#form-add-class-designation-structure').smkValidate()){
            show_loading_overlay();
            hide_form_modal('add-class-designation-structure-overlay', '');
            $scope.class_designation_structure.school_id = Factory.getSchoolID();
            $scope.class_designation_structure.class_designation_id = $scope.active_class_designation.class_designation_id;
            Service.addClassDesignationStructure($scope.class_designation_structure).then(function(response){
                Service.getClassDesignationStructures().then(function(response){
                    Factory.updateClassDesignationStructures(response.data);
                    $scope.class_designation_structures = response.data;
                    $scope.setActiveClassDesignation($scope.active_class_designation.class_designation_id);
                    clear_form_fields('form-add-class-designation-structure');
                    $scope.class_designation_structures = {};
                    hide_loading_overlay();
                    toast('Pattern Successfully Added');
                }, function(error){});
            }, function(error){
                console.log(error);
            });
        }
    }
    /** end add Class Designation structure **/
    
    /** GRADING LEVELS **/
    
    /** add grading level **/
    $scope.addGradingLevel = function(){
        if($('#form-add-score-group').smkValidate()){
            show_loading_overlay();
            $scope.grading_level.school_id = Factory.getSchoolID();
            Service.addGradingLevel($scope.grading_level).then(function(response){
                Service.getGradingLevels().then(function(response){
                    Factory.updateGradingLevels(response.data);
                    $scope.grading_levels = response.data;
                    clear_form_fields('form-add-score-group');
                    hide_loading_overlay();
                    toast('Grading Level Successfully Added');
                }, function(error){});
            }, function(error){
                console.log(error);
            });
        }
    }
    /** end add grading level **/
    
    /** set active grading level **/
    $scope.setActiveGradingLevel = function(grading_level_id){
        $scope.active_grading_level = Factory.getGradingLevel(grading_level_id);
        $scope.active_grading_level_structures = Factory.getGradingLevelStructures_(grading_level_id);
    }
    try{
        $scope.setActiveGradingLevel($scope.grading_levels[0].grading_level_id);
    }catch(e){
        console.log(e.message);
    }
    /** end set active grading level **/
    
    /** add grading level structure **/
    $scope.show_add_score_group_structure_overlay = function(){
        $('#add-score-group-structure-overlay').show();
    }
    $scope.addGradingLevelStructure = function(){
        if($('#form-add-score-group-structure').smkValidate()){
            show_loading_overlay();
            hide_form_modal('add-score-group-structure-overlay', '');
            $scope.grading_level_structure.school_id = Factory.getSchoolID();
            $scope.grading_level_structure.grading_level_id = $scope.active_grading_level.grading_level_id;
            Service.addGradingLevelStructure($scope.grading_level_structure).then(function(response){
                Service.getGradingLevelStructures().then(function(response){
                    Factory.updateGradingLevelStructures(response.data);
                    $scope.grading_level_structures = response.data;
                    $scope.setActiveGradingLevel($scope.active_grading_level.grading_level_id);
                    clear_form_fields('form-add-score-group-structure');
                    hide_loading_overlay();
                    toast('Pattern Successfully Added');
                }, function(error){});
            }, function(error){
                console.log(error);
            });
        }
    }
    /** end add grading level structure **/
    
    /** set class levels **/
    $scope.setClassLevels = function(class_type_id){
        $scope.class_levels = Factory.getClassTypeLevels(class_type_id);
    }
    
    /** set classes **/
    $scope.setClasses = function(class_level_id){
        $scope.classes = Factory.getLevelClasses(class_level_id);
    }
    
    $scope.setClass = function(class_id){
        $scope.classs = Factory.getClass(class_id);
    }
    
    /** set active session **/
    $scope.setActiveSession = function(session_id){
        $scope.active_session = Factory.getSession(session_id);
        $scope.active_session_quota = Factory.getSessionQuotas(session_id);
        $scope.active_exams = [];
    }
    
    
    /** CLASS EXAMINATION **/
    
    /** add examination **/
    $scope.show_add_examination_overlay = function(){
        $('#add-examination-overlay').fadeIn(300);
    }
    $scope.new_examination = {};
    $scope.addExamination = function(){
        if($('#form-add-examination').smkValidate()){
            show_loading_overlay();
            hide_form_modal('add-examination-overlay', '');
            $scope.new_examination.class_id = $scope.classs.class_id;
            $scope.new_examination.school_id = Factory.getSchoolID();
            $scope.new_examination.quota_id = $scope.default_quota.quota_id;
            $scope.new_examination.session_id = $scope.default_quota.session_id;
            Service.addExamination($scope.new_examination).then(function(response){
                Service.getExaminations().then(function(response){
                    Factory.updateExaminations(response.data);
                    $scope.setActiveClassQuotaExams($scope.classs.class_id);
                    $scope.new_examination.name = $scope.new_examination.description = "";
                    hide_loading_overlay();
                    toast("Examination added successfully");
                }, function(error){});
            }, function(error){
                console.log(error);
            });
        }
    }
    /** end add examination **/
    $scope.active_exams = [];
    $scope.setActiveClassQuotaExams = function(class_id){
        $scope.classs = Factory.getClass(class_id);
        $scope.quota = Factory.getQuota($scope.default_quota.quota_id);
        $scope.active_exams = Factory.getClassQuotaExams(class_id, $scope.default_quota.quota_id);
        $scope.examination_group = Factory.getExaminationGroup(class_id, $scope.default_quota.quota_id);
    
        //console.log
    }
    
    /** show ALL class exams**/
    $scope.showClassExams = function(){
        $scope.new_timetable = [];
        showCard_('card-exam-settings', 'card-class-exams');
    }
    
    /** create class exam. set timetable **/
    $scope.createClassExam = function(exam_id){
        $scope.examination = Factory.getExamination(exam_id);
        $scope.class_exam_subject_timetable = Factory.getClassQuotaExamTimetable($scope.classs.class_id, exam_id);
        showCard_('card-exam-settings', 'card-create-class-exam');
    }
    
    /** show class exam. set timetable **/
    $scope.viewClassExam = function(exam_id){
        $scope.examination = Factory.getExamination(exam_id);
        $scope.class_exam_timetable = Factory.getExamTimetable(exam_id);
        showCard_('card-exam-settings', 'card-view-class-exam');
    }
    
    /** create class exam timetable **/
    $scope.new_timetable = [];
    $scope.createClassTimetable = function(){
        if($('#exam-timetable-form').smkValidate()){
            show_loading_overlay(); 
            Service.createClassExamTimetable({'timetable': $scope.new_timetable, 'examination': $scope.examination}).then(function(response){
                //update class_exam_timetable
                Service.getExaminationTimetables(Factory.getSchoolID(), $scope.default_quota).then(function(response){
                    Factory.updateExamTimetable(response.data);
                }, function(error){});
                hide_loading_overlay();
                toast('Done!');
            }, function(error){
                console.log(error);
            });
        }else{
            toast('Kindly set timetable correctly');
        }
    }
    
    /**connect exams **/
    $scope.showConnectExams = function(){
        showCard_('card-exam-settings', 'card-connect-exams');
    }
    
    $scope.connectExams = function(){ 
        if($scope.getTotalWeightage() != 100){
            toast('Total weightage must be 100');
            return;
        }
        
        if($('#form-connect-exam-details').smkValidate()){
            show_loading_overlay();
            $scope.examination_group.quota_id = $scope.quota.quota_id;
            $scope.examination_group.class_id = $scope.classs.class_id;
            $scope.examination_group.school_id = Factory.getSchoolID();
            Service.connectExaminations($scope.examination_group).then(function(response){
                Service.getExaminationGroups(Factory.getSchoolID()).then(function(response){
                    Factory.updateExaminationGroups(response.data);
                    Service.getExaminations(Factory.getSchoolID()).then(function(response){
                        Factory.updateExaminations(response.data);
                        $scope.setActiveClassQuotaExams($scope.classs.class_id, $scope.quota.quota_id);
                        hide_loading_overlay();
                        toast('Examinations connected successfully');
                    });
                });
            }, function(error){});
        }
        
    }
    
    $scope.getTotalWeightage = function(){
        var sum = 0;
        angular.forEach($scope.examination_group.exams, function(value, key, obj){
            if(value.weightage)
                sum += parseInt(value.weightage); 
        });
        return sum;
    }
    
    
    $scope.setTotalWeightage = function(){
        var s = $scope.getTotalWeightage();
        var color;
        if(s < 100){
            color = 'blue';
        }else if(s == 100){
            color = 'green';
        }else{
            color = 'red';
        }
        $('#total_weightage').html('<em style="color: '+color+'">'+s+'</em>');
    }
    
});



app.controller('ExaminationAssessmentCtrl', function($scope, $scope, Factory, Service, class_types){
    
    $scope.factory = Factory;
    
    $scope.default_quota = $scope.$parent.default_quota;
    
    $scope.class_types = class_types.data;
    
    $scope.basic_class_subjects = [];
    
    $scope.students = [];
    
    $scope.quota_exams = {};
    
    $scope.classs = {};
    
    $scope.student = {};
    
    $scope.subject = {};
    
    $scope.class_subject_continuous_assessment = {};
    
    
    /** set class levels **/
    $scope.setClassLevels = function(class_type_id){
        $scope.class_levels = Factory.getClassTypeLevels(class_type_id);
    }
    
    /** set classes **/
    $scope.setClasses = function(class_level_id){
        $scope.classes = Factory.getLevelClasses(class_level_id);
    }
    
    $scope.setClass = function(class_id){
        $scope.subject = {};
        show_loading_overlay();
        Service.getClassStudents(class_id).then(function(response){
            $scope.classs = Factory.getClass(class_id);
            $scope.basic_class_subjects = Factory.getBasicClassSubjects(class_id);
            $scope.students = response.data;
            $scope.quota_exams = Factory.getClassQuotaExams(class_id, $scope.default_quota.quota_id);
            //get CAs
            Service.getClassQuotaContinuousAssessment(Factory.getSchoolID(), $scope.default_quota, class_id).then(function(response){
                Factory.updateClassQuotaContinuousAssessment(response.data);
            },  function(error){});
            hide_loading_overlay();
        }, function(error){});
        
    }
    
    $scope.setActiveSubject = function(subject_id){
        $scope.students = $scope.students;
        $scope.quota_exams = Factory.getClassQuotaExams($scope.classs.class_id, $scope.default_quota.quota_id);
        $scope.subject = Factory.getSubject(subject_id);
    }
    
    
    $scope.new_CAs = [];
    
    $scope.saveContinuousAssessment = function(){
        
        console.log($scope.new_CAs); return;
        
        //show_loading_overlay();
        $scope.class_subject_continuous_assessment.school_id = Factory.getSchoolID();
        $scope.class_subject_continuous_assessment.session_id = $scope.default_quota.session_id;
        $scope.class_subject_continuous_assessment.quota_id = $scope.default_quota.quota_id;
        $scope.class_subject_continuous_assessment.class_id = $scope.classs.class_id;
        $scope.class_subject_continuous_assessment.subject_id = $scope.subject.subject_id;
        
        console.log($scope.class_subject_continuous_assessment); return;
        
        Service.saveContinuousAssessment($scope.class_subject_continuous_assessment).then(function(response){
            Service.getClassQuotaContinuousAssessment(Factory.getSchoolID(), $scope.default_quota, $scope.classs.class_id).then(function(response){
                Factory.updateClassQuotaContinuousAssessment(response.data);
                hide_loading_overlay();
                toast('Successfully Saved');
            },  function(error){});
        }, function(error){});
    }
    
    
    $scope.tt = function(){
        console.log($scope.subject.subject_id);
        
    }
    
    
    
});

