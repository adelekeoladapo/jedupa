app.controller('ResultSettingsCtrl', function($scope, $scope, Factory, Service, grading_levels, class_designations, class_types, sessions){
    
    $scope.factory = Factory;
    
    $scope.class_types = class_types.data;
    
    $scope.sessions = sessions.data;
    
    $scope.grading_levels = grading_levels.data;
    
    $scope.class_designations = class_designations.data;
    
    $scope.class_designation_structures = Factory.getClassDesignationStructures();
    
    $scope.grading_levels = Factory.getGradingLevels();
    
    $scope.grading_level_structures = Factory.getGradingLevelStructures();
    
    $scope.default_quota = $scope.$parent.default_quota;//Factory.getDefaultQuota();
    
    $scope.class_students = [];
    
    $scope.class_designation = {};
    
    $scope.class_designation_structure = {};
    
    $scope.grading_level = {};
    
    $scope.grading_level_structure = {};
    
    $scope.classs = {};
    
    $scope.examination_group = {};
    
    $scope.class_quota_result_settings = {};
    
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
                    toastr.success('Class Designation Successfully Added');
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
                    toastr.success('Pattern Successfully Added');
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
                    toastr.success('Grading Level Successfully Added');
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
                    toastr.success('Pattern Successfully Added');
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
        show_loading_overlay();
        Service.getClassQuotaResultSettings(class_id, $scope.default_quota.quota_id).then(function(response){
            $scope.class_quota_result_settings = (response.data != 'null') ?  response.data : {};
            $scope.classs = Factory.getClass(class_id);
            hide_loading_overlay();
        }, function(error){});
    }
    
    /** add class quota result settings **/
    
    $scope.addQuotaResultSettings = function(){
        if($('#form-add-class-quota-result-settings').smkValidate()){
            show_loading_overlay();
            $scope.class_quota_result_settings.school_id = Factory.getSchoolID();
            $scope.class_quota_result_settings.class_id = $scope.classs.class_id;
            $scope.class_quota_result_settings.session_id = $scope.default_quota.session_id;
            $scope.class_quota_result_settings.quota_id = $scope.default_quota.quota_id;
            Service.saveClassQuotaResultSettings($scope.class_quota_result_settings).then(function(response){
                hide_loading_overlay();
                toastr.success("Saved Successfully");
            }, function(error){
                console.log(error);
            });
        }
    }
    /** end add class quota result settings **/
    
    
    
    
    
    
    
    
    
    /** set active session **/
    $scope.setActiveSession = function(session_id){
        $scope.active_session = Factory.getSession(session_id);
        $scope.active_session_quota = Factory.getSessionQuotas(session_id);
        $scope.active_exams = [];
    }
    
});



app.controller('ResultCtrl', function($scope, $scope, Factory, Service, class_types){
    
    $scope.factory = Factory;
    
    $scope.default_quota = $scope.$parent.default_quota;
    
    $scope.class_types = class_types.data;
    
    $scope.basic_class_subjects = [];
    
    $scope.basic_class_subjects_2 = [];
    
    $scope.students = [];
    
     $scope.class_subject_continuous_assessments = [];
     
     $scope.quota_exams = [];
    
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
        $scope.classs = Factory.getClass(class_id);
        
        $scope.subject = {};
        show_loading_overlay();
        Service.getClassQuotaBroadsheet(Factory.getSchoolID(), $scope.default_quota.quota_id, class_id).then(function(response){
            $scope.class_broadsheet = response.data;
            $scope.classs = Factory.getClass(class_id);
            $scope.basic_class_subjects = Factory.getBasicClassSubjects(class_id);
            $scope.quota_exams = Factory.getClassQuotaExams(class_id, $scope.default_quota.quota_id);
            Service.getClassQuotaSubjectsContinuousAssesssmentsSums(Factory.getSchoolID(), $scope.default_quota.quota_id, class_id).then(function(response){
                Factory.updateClassQuotaContinuousAssessmentSums(response.data);
            },  function(error){});
            hide_loading_overlay();
        }, function(error){});
    }
    
    
    /**
     * Student Result
    **/
   
   $scope.setClass_2 = function(class_id){
       $scope.classs_2 = Factory.getClass(class_id);
       show_loading_overlay();
        Service.getClassStudents(class_id).then(function(response){
            $scope.students_2 = response.data;
            $scope.basic_class_subjects_2 = Factory.getBasicClassSubjects(class_id);
            $scope.quota_exams = Factory.getClassQuotaExams(class_id, $scope.default_quota.quota_id);
            //get CAs
            Service.getClassQuotaContinuousAssessment(Factory.getSchoolID(), $scope.default_quota, class_id).then(function(response){
                Factory.updateClassQuotaContinuousAssessment(response.data);
                console.log(response.data);
            },  function(error){});
            hide_loading_overlay();
        }, function(error){});
   }
   
   
   $scope.setClassStudent = function(student_id){
       $scope.setClass_2($scope.classs_2.class_id);
       $scope.student_2 = {'student_id': student_id};
       //console.log(Factory.getContinuousAssessment(student_id, exam.examination_id, subject.subject_id));
   }
    
    
});

