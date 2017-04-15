app.controller('ResultSettingsCtrl', function($scope, $scope, Factory, Service, grading_levels, class_designations, class_types, sessions, psychomotors, effective_areas){
    
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
    
    $scope.psychomotors = psychomotors.data;
    
    $scope.effective_areas = effective_areas.data;
    
    $scope.class_designation = {};
    
    $scope.class_designation_structure = {};
    
    $scope.grading_level = {};
    
    $scope.grading_level_structure = {};
    
    $scope.classs = {};
    
    $scope.examination_group = {};
    
    $scope.class_quota_result_settings = {};
    
    $scope.psychomotor = {};
    
    $scope.effective_area = {};
    
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
    
    
    /*
     * BEHAVIOURAL TRAITS 
    */
   
   /** add psychomotor skill **/
    $scope.show_add_psychomotor_overlay = function(){
        $('#add-psychomotor-overlay').show();
    }
    $scope.addPsychomotor = function(){
        if($('#form-add-psychomotor').smkValidate()){
            show_loading_overlay();
            hide_form_modal('add-psychomotor-overlay', '');
            $scope.psychomotor.school_id = Factory.getSchoolID();
            Service.addPsychomotor($scope.psychomotor).then(function(response){
                Service.getPsychomotors().then(function(response){
                    Factory.updatePsychomotors(response.data);
                    $scope.psychomotors = response.data;
                    clear_form_fields('form-add-psychomotor');
                    hide_loading_overlay();
                    toastr.success('Psychomotor Successfully Added');
                }, function(error){});
            }, function(error){
                toastr.error(error);
            });
        }
    }
    /** end add psychomotor **/
    
    /** update psychomotor **/
    $scope.updatePsychomotor = function(data, status){
        show_loading_overlay();
        data.status = (status) ? 1 : 0; 
        Service.updatePsychomotor(data).then(function(response){
            Service.getPsychomotors().then(function(response){
                Factory.updatePsychomotors(response.data);
                $scope.psychomotors = response.data;
                hide_loading_overlay();
                (status) ? toastr.success('Activated Successfully') : toastr.success('Deactivated Successfully');
            }, function(error){});
        }, function(error){
            toastr.error(error);
        });
    }
    /** end update psychomotor **/
    
    /** add effective area **/
    $scope.show_add_effective_area_overlay = function(){
        $('#add-effective-area-overlay').show();
    }
    $scope.addEffectiveArea = function(){
        if($('#form-add-effective-area').smkValidate()){
            show_loading_overlay();
            hide_form_modal('add-effective-area-overlay', '');
            $scope.effective_area.school_id = Factory.getSchoolID();
            Service.addEffectiveArea($scope.effective_area).then(function(response){
                Service.getEffectiveAreas().then(function(response){
                    Factory.updateEffectiveAreas(response.data);
                    $scope.effective_areas = response.data;
                    clear_form_fields('form-add-effective-area');
                    hide_loading_overlay();
                    toastr.success('Successfully Added');
                }, function(error){});
            }, function(error){
                toastr.error(error);
            });
        }
    }
    /** end add psychomotor **/
    
    /** update psychomotor **/
    $scope.updateEffectiveArea = function(data, status){
        show_loading_overlay();
        data.status = (status) ? 1 : 0; 
        Service.updateEffectiveArea(data).then(function(response){
            Service.getEffectiveAreas().then(function(response){
                Factory.updateEffectiveAreas(response.data);
                $scope.effective_area = response.data;
                hide_loading_overlay();
                (status) ? toastr.success('Activated Successfully') : toastr.success('Deactivated Successfully');
            }, function(error){});
        }, function(error){
            toastr.error(error);
        });
    }
    /** end update psychomotor **/
    
    
});



app.controller('ResultCtrl', function($scope, $scope, Factory, Service, class_types){
    
    $scope.factory = Factory;
    
    $scope.school = Factory.getSchool();
    
    $scope.default_quota = $scope.$parent.default_quota;
    
    $scope.class_types = class_types.data;
    
    $scope.basic_class_subjects = [];
    
    $scope.basic_class_subjects_2 = [];
    
    $scope.students = [];
    
     $scope.class_subject_continuous_assessments = [];
     
    $scope.class_total_quota_subject_exams_scores = [];
    
    $scope.class_quota_psychomotors = [];
     
    $scope.quota_exams = [];
    
    $scope.quota_exams = {};
    
    $scope.classs = {};
    
    $scope.student = {};
    
    $scope.subject = {};
    
    $scope.class_subject_continuous_assessment = {};
    
    $scope.active_psychomotors = Factory.getActivePsychomotors();
    
    $scope.active_effective_areas = Factory.getActiveEffectiveAreas();
    
    $scope.ratings = ["", "A", "B", "C", "D", "E"];
    
    
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
   
   $scope.grading_level_structure = [];
   
   $scope.class_broadsheet_2 = [];
   
   $scope.class_quota_remarks = [];
   
   $scope.effort_rating = [];
   
   $scope.setClass_2 = function(class_id){
       $scope.student_2 = null;
       $scope.classs_2 = Factory.getClass(class_id);
       show_loading_overlay();
        Service.getClassStudents(class_id).then(function(response){
            $scope.students_2 = response.data;
            $scope.basic_class_subjects_2 = Factory.getBasicClassSubjects(class_id);
            $scope.quota_exams = Factory.getClassQuotaExams(class_id, $scope.default_quota.quota_id);
            //get CAs
            Service.getClassQuotaContinuousAssessment(Factory.getSchoolID(), $scope.default_quota, class_id).then(function(response){
                Factory.updateClassQuotaContinuousAssessment(response.data);
            },  function(error){});
            
            Service.getClassTotalQuotaSubjectExamsScores(class_id, $scope.default_quota.quota_id).then(function(response){
                $scope.class_total_quota_subject_exams_scores = response.data;
            }, function(error){});
            
            Service.getClassQuotaResultSettings(class_id, $scope.default_quota.quota_id).then(function(response){
                $scope.grading_level_structure = Factory.getGradingLevelStructures_(response.data.grading_level_id);
                $scope.effort_rating = Factory.getEffortRating($scope.grading_level_structure);
            }, function(error){});
            
            Service.getClassQuotaBroadsheet(Factory.getSchoolID(), $scope.default_quota.quota_id, class_id).then(function(response){
                $scope.class_broadsheet_2 = response.data;
            }); 
            
            Service.getClassQuotaPsychomotors(class_id, $scope.default_quota.quota_id).then(function(response){
                $scope.class_quota_psychomotors = response.data;
            });
            
            Service.getClassQuotaEffectiveAreas(class_id, $scope.default_quota.quota_id).then(function(response){
                $scope.class_quota_effective_areas = response.data;
            });
            
            Service.getClassQuotaRemarks(class_id, $scope.default_quota.quota_id).then(function(response){
                $scope.class_quota_remarks = response.data;
            });
            
            hide_loading_overlay();  
        }, function(error){});
   }
   
   $scope.getStudentBroadsheet = function(student_id){
        var dt = {};
        angular.forEach($scope.class_broadsheet_2, function(value, key, obj){
            if(value.student_id == student_id){
                dt = angular.copy(obj[key]);
            }
        });
        return dt;
   };
   
   $scope.student_broadsheet = {};
   $scope.setClassStudent = function(student_id){
        show_loading_overlay();
        //$scope.setClass_2($scope.classs_2.class_id);
        Service.getClassStudents($scope.classs_2.class_id).then(function(response){
            $scope.students_2 = response.data;
            $scope.basic_class_subjects_2 = Factory.getBasicClassSubjects($scope.classs_2.class_id);
            $scope.quota_exams = Factory.getClassQuotaExams($scope.classs_2.class_id, $scope.default_quota.quota_id);
            Service.getClassQuotaContinuousAssessment(Factory.getSchoolID(), $scope.default_quota, $scope.classs_2.class_id).then(function(response){
                Factory.updateClassQuotaContinuousAssessment(response.data);
            },  function(error){});
            $scope.student_2 = {'student_id': student_id};
            $scope.student_broadsheet = $scope.getStudentBroadsheet(student_id);
            $scope.student_psychomotors = $scope.getStudentPsychomotors($scope.student_2.student_id); 
            $scope.student_effective_areas = $scope.getStudentEffectiveAreas($scope.student_2.student_id); 
            $scope.setStudentRemarks(student_id);
        });
        hide_loading_overlay();
   }
    
   $scope.getSubjectStudentsScores = function(subject_id){
       var subject_students_scores = [];
       angular.forEach($scope.class_total_quota_subject_exams_scores, function(value, key, obj){
            if(value.subject_id == subject_id){
               subject_students_scores.push(value.score);
            }
        });
        return subject_students_scores;
   }
   
   
   
   $scope.getSubjectTotalScore = function(subject_id){
        var sum = 0;
        angular.forEach($scope.class_total_quota_subject_exams_scores, function(value, key, obj){
            if(value.subject_id == subject_id){
                sum += parseInt(value.score);
            }
        });
        return sum;
   }
   
   $scope.getTotalScore = function(){
        var sum = 0;
        angular.forEach($scope.class_total_quota_subject_exams_scores, function(value, key, obj){
           // if(value.subject_id == subject_id){
                sum += parseInt(value.score);
            //}
        });
        return sum;
   }
   
   $scope.getStudentSubjectTotalScore = function(student_id, subject_id){
        var score = 0;
        angular.forEach($scope.class_total_quota_subject_exams_scores, function(value, key, obj){
            if(value.subject_id == subject_id && value.student_id == student_id){
                //console.log("StudentID: "+value.student_id+", SubjectID: "+value.subject_id+", Score: "+value.score+", QuotaID: "+value.quota_id);
                score = value.score;
            }
        });
        return score;
    }
   
    /** behavioural traits **/
   
    /** add user psychomotor skill **/
    $scope.psychomotor = {};
    $scope.addUserPsychomotor = function(psychomotor_id, rating){
        //show_loading_overlay();
        $scope.psychomotor.psychomotor_id = psychomotor_id;
        $scope.psychomotor.school_id = Factory.getSchoolID();
        $scope.psychomotor.class_id = $scope.classs_2.class_id;
        $scope.psychomotor.quota_id = $scope.default_quota.quota_id; 
        $scope.psychomotor.student_id = $scope.student_2.student_id;
        $scope.psychomotor.rating = rating; 
        Service.addUserPsychomotor($scope.psychomotor).then(function(response){
            Service.getClassQuotaPsychomotors($scope.classs_2.class_id, $scope.default_quota.quota_id).then(function(response){
                $scope.class_quota_psychomotors = response.data;
                toastr.success('Successfully Updated');
            });
        }, function(error){
            toastr.error(error);
        });
    }
    /** end add psychomotor **/
    
    $scope.getStudentPsychomotorRating = function(student_id, psychomotor_id){
        var dt = {};
        angular.forEach($scope.class_quota_psychomotors, function(value, key, obj){
            if((value.student_id == student_id) && (value.psychomotor_id == psychomotor_id)){
                dt = angular.copy(obj[key]);
            }
        });
        return dt.rating;
   };
   
   $scope.getStudentPsychomotors = function(student_id){
       var dt = [];
       angular.forEach($scope.active_psychomotors, function(value, key, obj){
           value.rating = $scope.getStudentPsychomotorRating(student_id, value.psychomotor_id) 
           dt.push(angular.copy(obj[key]));
        });
        return dt;
   }
   
   
   /** effective areas **/
   
   /** add user effective area **/
    $scope.effective_area = {};
    $scope.addUserEffectiveArea = function(effective_area_id, rating){
        //show_loading_overlay();
        $scope.effective_area.effective_area_id = effective_area_id;
        $scope.effective_area.school_id = Factory.getSchoolID();
        $scope.effective_area.class_id = $scope.classs_2.class_id;
        $scope.effective_area.quota_id = $scope.default_quota.quota_id; 
        $scope.effective_area.student_id = $scope.student_2.student_id;
        $scope.effective_area.rating = rating; 
        Service.addUserEffectiveArea($scope.effective_area).then(function(response){
            Service.getClassQuotaEffectiveAreas($scope.classs_2.class_id, $scope.default_quota.quota_id).then(function(response){
                $scope.class_quota_effective_areas = response.data;
                toastr.success('Successfully Updated');
            });
        }, function(error){
            toastr.error(error);
        });
    }
    /** end add effective area **/
   
   $scope.getStudentEffectiveAreaRating = function(student_id, effective_area_id){
        var dt = {};
        angular.forEach($scope.class_quota_effective_areas, function(value, key, obj){
            if((value.student_id == student_id) && (value.effective_area_id == effective_area_id)){
                dt = angular.copy(obj[key]);
            }
        });
        return dt.rating;
   };
   
   $scope.getStudentEffectiveAreas = function(student_id){
       var dt = [];
       angular.forEach($scope.active_effective_areas, function(value, key, obj){
           value.rating = $scope.getStudentEffectiveAreaRating(student_id, value.effective_area_id); 
           dt.push(angular.copy(obj[key]));
        });
        return dt;
   }
   
   
   /** remark **/
   
   $scope.remark = {};
   $scope.addRemark = function(type, comment){
       $scope.remark.class_id = $scope.classs_2.class_id;
       $scope.remark.student_id = $scope.student_2.student_id;
       $scope.remark.quota_id = $scope.default_quota.quota_id;
       $scope.remark.type = type;
       $scope.remark.comment = comment;
       
       Service.addRemark($scope.remark).then(function(response){
           Service.getClassQuotaRemarks($scope.classs_2.class_id, $scope.default_quota.quota_id).then(function(response){
               $scope.class_quota_remarks = response.data;
           }, function(error){
               toastr.error(error);
           });
       }, function(error){
           toastr.error(error);
       });
   }
   
    $scope.remark_1 = $scope.remark_2 = {};
    $scope.setStudentRemarks = function(student_id){
        f1 = f2 = false;
        angular.forEach($scope.class_quota_remarks, function(value, key, obj){
            if(value.student_id == student_id && value.type == 1){
                $scope.remark_1 = angular.copy(obj[key]);
                f1 = true;
            }else if(value.student_id == student_id && value.type == 2){
                $scope.remark_2 = angular.copy(obj[key]);
                f2 = true;
            }
            
            if(!f1)
               $scope.remark_1 = {};
           
           if(!f2)
               $scope.remark_2 = {};
            
        });
    }
    
    
});

