app.controller('GeneralSettingsCtrl', function($scope, Factory, Service, states, school){
    
    $scope.factory = Factory;
    
    $scope.app_data = $scope.factory.getAppData();
    
    $scope.states = states.data;
    
    $scope.school = school.data;
    
    $scope.student_categories = Factory.getStudentCategories();
    
    $scope.additional_fields = Factory.getAdditionalFields();
    
    $scope.student_category = {};
    
    $scope.additional_field = {};
    
    
    $scope.updateSchool = function(){
        if($('#form-update-school').smkValidate()){
            show_loading_overlay();
            var form_data = new FormData($('#form-update-school')[0]);
            $.ajax({
                type: "POST",
                url: base_url+"api/update-school",
                data: form_data,
                success:function(result, status, xhr){ 
                    result = JSON.parse(result);
                    hide_loading_overlay();
                    if(result.status){
                        toast(result.message);
                    }else{
                        toast(result.message);
                    }
                },
                complete: function(){
                },
                timeout: 50000,
                error: function(){
                    toast("An error occurred. Try again");
                },
                //Options to tell jQuery not to process data or worry about content-type.
                cache: false,
                contentType: false,
                processData: false
            });
        }
        return false;
    };
    
    /**
     * Student Category
     */
    
    /** add department **/
    
    $scope.show_add_student_category_overlay = function(){
        $('#add-student-category-overlay').show();
    }
    
    $scope.addStudentCategory = function(){
        if($('#form-add-student-category').smkValidate()){
            hide_form_modal('add-student-category-overlay', '');
            show_loading_overlay();
            $scope.student_category.school_id = Factory.getSchoolID();
            Service.addStudentCategory($scope.student_category).then(function(response){
                Service.getStudentCategories($scope.student_category.school_id).then(function(response){
                    $scope.student_categories = response.data;
                    Factory.updateStudentCategories(response.data);
                    clear_form_fields('form-add-student-category');
                    hide_loading_overlay();
                    toast('Category Successfully Added');
                }, function(error){
                    console.log(error);
                });
            }, function(error){
                console.log(error);
            });
        }
    };
    /** end add department **/
    
    
    /**
     * ADDITIONAL FIELD
     */
    
    /** add additional field **/
    
    $scope.show_add_additional_field_overlay = function(){
        $('#add-additional-field-overlay').show();
    }
    
    $scope.addAdditionalField = function(){
        if($('#form-add-additional-field').smkValidate()){
            hide_form_modal('add-additional-field-overlay', '');
            show_loading_overlay();
            $scope.additional_field.school_id = Factory.getSchoolID();
            Service.addAdditionalField($scope.additional_field).then(function(response){
                Service.getAdditionalFields($scope.additional_field.school_id).then(function(response){ console.log(response.data);
                    $scope.additional_fields = response.data;
                    Factory.updateAdditionalFields(response.data);
                    clear_form_fields('form-add-additional-field');
                    hide_loading_overlay();
                    toast('Field Successfully Added');
                }, function(error){
                    console.log(error);
                });
            }, function(error){
                console.log(error);
            });
        }
    };
    /** end add additional field **/
    
});


/*******************Academic Settings Controller ***************/

app.controller('AcademicSettingsCtrl', function($scope, Factory, Service, departments, classes, sessions, employees){
    
    $scope.factory = Factory;
    
    Factory.updateStudentDepartments(departments.data);
    
    Factory.updateClasses(classes.data);
    
    Factory.updateSessions(sessions.data);
    
    $scope.departments = Factory.getStudentDepartments();
    
    $scope.classes = Factory.getClasses();
    
    $scope.class_levels = Factory.getClassLevels();
    
    $scope.class_types = Factory.getClassTypes();  
    
    $scope.sessions = Factory.getSessions();
    
    $scope.quotas = Factory.getQuotas();
    
    $scope.score_groups = Factory.getScoreGroups();
    
    $scope.score_group_structures = Factory.getScoreGroupStructures();
    
    $scope.class_timing_sets = Factory.getClassTimingSets();
    
    $scope.class_periods = Factory.getClassPeriods();
    
    $scope.subjects = Factory.getSubjects();
    
    $scope.employees = employees.data;
    
    $scope.weekdays = Factory.getWeekdays();
    
    $scope.weekday_class_periods = Factory.getWeekdayClassPeriods();
    
    $scope.basic_class_subjects = [];
    
    $scope.class_subject = {};
    
    $scope.dept = {};
    
    $scope.classs = {};
    
    $scope.class_level = {};
    
    $scope.class_type = {};
    
    $scope.session = {};
    
    $scope.quota = {};
    
    $scope.score_group = {};
    
    $scope.score_group_structure = {};
    
    $scope.class_timing_set = {};
    
    $scope.subject = {};
    
    $scope.class_subject = {};
    
    $scope.class_period = {};
    
    $scope.weekday_class_period = {};
     
    
    /** add department **/
    
    $scope.show_add_dept_overlay = function(){
        $('#add-department-overlay').show();
    }
    
    $scope.addAcademicDept = function(){
        if($('#form-add-student-dept').smkValidate()){
            hide_form_modal('add-department-overlay', '');
            show_loading_overlay();
            $scope.dept.school_id = Factory.getSchoolID();
            Service.addDept($scope.dept).then(function(response){
                Service.getSchoolDepts($scope.dept.school_id).then(function(response){
                    $scope.departments = response.data;
                    Factory.updateStudentDepartments(response.data);
                    clear_form_fields('form-add-student-dept');
                    hide_loading_overlay();
                    toast('Department Successfully Added');
                }, function(error){
                    console.log(error);
                });
            }, function(error){
                console.log(error);
            });
        }
    };
    /** end add department **/
    
    /** add class **/
    $scope.show_add_class_overlay = function(){
        $('#add-class-overlay').show();
    }
    $scope.addClass = function(){
        if($('#form-add-class').smkValidate()){
            hide_form_modal('add-class-overlay', '');
            show_loading_overlay();
            $scope.classs.school_id = Factory.getSchoolID();
            $scope.classs.class_type_id = $scope.active_class_type.class_type_id;
            $scope.classs.class_level_id = $scope.active_level.class_level_id;
            Service.addClass($scope.classs).then(function(response){
                Service.getClasses(Factory.getSchoolID()).then(function(response){
                    $scope.classes = response.data;
                    Factory.updateClasses(response.data);
                    clear_form_fields('form-add-class');
                    $scope.setActiveLevel($scope.classs.class_level_id);
                    hide_loading_overlay();
                    toast('Class Successfully Added');
                }, function(error){
                    console.log(error);
                });
            }, function(error){
                console.log(error);
            });
        }
    };
    /** end add class **/
    $scope.showClass = function(class_id){
        $scope.classs = Factory.getClass(class_id);
        $scope.basic_class_subjects = Factory.getBasicClassSubjects(class_id);
        $scope.class_weekday_periods = Factory.getClassWeekdayPeriods_(class_id);
        showCard('class');
    }
    
    $scope.showClasses = function(){
        showCard('classes');
    }
    
    /** multiple assignment. discarded for now **/
    $scope.assignClassSubjectsX = function(){
        $scope.class_subject.school_id = Factory.getSchoolID();
        $scope.class_subject.class_id = $scope.classs.class_id;
        $scope.class_subject.score_group_id = $scope.score_groups[0].score_group_id;
        var form_data = new FormData($('#form-subject-list')[0]);
        var arr = [];
        for (var value of form_data.values()) {
            arr.push(value); 
        }
        $scope.class_subjects.subject_ids = arr;
        
        Service.assignClassSubjects($scope.class_subjects).then(function(response){
            console.log(response.data);
        }, function(error){
            console.log(error);
        });
        
    }
    
    /** assign subject to class **/
    $scope.show_assign_subject_overlay = function(){
        $('#assign-subject-overlay').show();
    }
    $scope.assignClassSubject = function(){
        if($('#form-assign-subject').smkValidate()){
            show_loading_overlay();
            hide_form_modal('assign-subject-overlay', '');
            $scope.class_subject.school_id = Factory.getSchoolID();
            $scope.class_subject.class_id = $scope.classs.class_id;
            Service.assignClassSubject($scope.class_subject).then(function(response){
                Service.getClassSubjects($scope.class_subject.school_id).then(function(response){
                    Factory.updateBasicClassSubjects(response.data);
                    $scope.basic_class_subjects = Factory.getBasicClassSubjects($scope.class_subject.class_id);
                    clear_form_fields('form-assign-subject');
                    hide_loading_overlay();
                }, function(error){});
            }, function(error){
                console.log(error);
            });
        }
        
    }
    
    $scope.deleteClassSubject = function(basic_class_subject){
        $d = confirm("Delete "+basic_class_subject.subject+"?");
        if($d){
            show_loading_overlay();
            Service.deleteClassSubject(basic_class_subject.class_basic_subject_id).then(function(response){
                Service.getClassSubjects(basic_class_subject.school_id).then(function(response){
                    Factory.updateBasicClassSubjects(response.data);
                    $scope.basic_class_subjects = Factory.getBasicClassSubjects(basic_class_subject.class_id);
                    hide_loading_overlay();
                    toast("Deleted Successfully")
                }, function(error){});
            }, function(error){
                console.log(error);
            });
        }
    }
    
    
    
    /*** CLASS LEVEL ***/
    
    /** add class level **/
    $scope.addClassLevel = function(){
        if($('#form-add-class-level').smkValidate()){
            show_loading_overlay();
            $scope.class_level.school_id = Factory.getSchoolID();
            $scope.class_level.class_type_id = $scope.active_class_type.class_type_id;
            Service.addLevel($scope.class_level).then(function(response){
                Service.getLevels().then(function(response){
                    Factory.updateLevels(response.data);
                    $scope.class_levels = response.data;
                    $scope.setActiveClassType($scope.active_class_type.class_type_id);
                    clear_form_fields('form-add-class-level');
                    hide_loading_overlay();
                    toast('Level Successfully Added');
                }, function(error){});
            }, function(error){
                console.log(error);
            });
        }
    }
    /** end add class level **/
    
    /** set active level **/
    $scope.setActiveLevel = function(level_id){
        $scope.active_level = Factory.getLevel(level_id);
        $scope.active_level_classes = Factory.getLevelClasses(level_id);
    }
    try{
        $scope.setActiveLevel($scope.class_levels[0].class_level_id);
    }catch(e){
        console.log(e.message);
    }
    
    
    
    
    /*** CLASS TYPE ***/
    
    /** add class type **/
    $scope.addClassType = function(){
        if($('#form-add-class-type').smkValidate()){
            show_loading_overlay();
            $scope.class_type.school_id = Factory.getSchoolID();
            Service.addClassType($scope.class_type).then(function(response){
                Service.getClassTypes().then(function(response){
                    Factory.updateClassTypes(response.data);
                    $scope.class_types = response.data;
                    clear_form_fields('form-add-class-type');
                    hide_loading_overlay();
                    toast('Type Successfully Added');
                }, function(error){});
            }, function(error){
                console.log(error);
            });
        }
    }
    /** end add class type **/
    
    /** set active class type **/
    $scope.setActiveClassType = function(class_type_id){
        $scope.active_class_type = Factory.getClassType(class_type_id);
        $scope.active_class_type_levels = Factory.getClassTypeLevels(class_type_id);
        try{
            if($scope.active_class_type_levels.length > 0)
                $scope.setActiveLevel($scope.active_class_type_levels[0].class_level_id);
            else
                $scope.active_level = {};
        }catch(e){
            console.log(e.message);
        }
    }
    try{
        $scope.setActiveClassType($scope.class_types[0].class_type_id);
    }catch(e){
        console.log(e.message);
    }
    
    
    /**** SESSION *****/
    
    /** add session **/
    $scope.show_add_session_overlay = function(){
        $('#add-session-overlay').show();
    }
    $scope.addSession = function(){
        if($('#form-add-session').smkValidate()){
            show_loading_overlay();
            hide_form_modal('add-session-overlay', '');
            $scope.session.school_id = Factory.getSchoolID();
            Service.addSession($scope.session).then(function(response){
                Service.getSessions().then(function(response){
                    Factory.updateSessions(response.data);
                    $scope.sessions = response.data;
                    clear_form_fields('form-add-session');
                    hide_loading_overlay();
                    toast('Session Successfully Added');
                }, function(error){});
            }, function(error){
                console.log(error);
            });
        }
    }
    /** end add session **/
    
    /** set active session **/
    $scope.setActiveSession = function(session_id){
        $scope.active_session = Factory.getSession(session_id);
        $scope.active_session_quota = Factory.getSessionQuotas(session_id);
    }
    try{
        $scope.setActiveSession($scope.sessions[0].session_id);
    }catch(e){
        console.log(e.message);
    }
    
    
    /** QUOTA **/
    
    /** add quota **/
    $scope.show_add_quota_overlay = function(){
        $('#add-quota-overlay').show();
    }
    $scope.addQuota = function(){
        if($('#form-add-quota').smkValidate()){
            show_loading_overlay();
            hide_form_modal('add-quota-overlay', '');
            $scope.quota.school_id = Factory.getSchoolID();
            $scope.quota.session_id = $scope.active_session.session_id;
            Service.addQuota($scope.quota).then(function(response){
                Service.getQuotas().then(function(response){
                    Factory.updateQuotas(response.data);
                    $scope.quotas = response.data;
                    $scope.setActiveSession($scope.active_session.session_id);
                    clear_form_fields('form-add-quota');
                    hide_loading_overlay();
                    toast('Quota Successfully Added');
                }, function(error){});
            }, function(error){
                console.log(error);
            });
        }
    }
    /** end add quota **/
    
    
    /** SCORE GROUP **/
    
    /** add score group **/
    $scope.addScoreGroup = function(){
        if($('#form-add-score-group').smkValidate()){
            show_loading_overlay();
            $scope.score_group.school_id = Factory.getSchoolID();
            Service.addScoreGroup($scope.score_group).then(function(response){
                Service.getScoreGroups().then(function(response){
                    Factory.updateScoreGroups(response.data);
                    $scope.score_groups = response.data;
                    clear_form_fields('form-add-score-group');
                    hide_loading_overlay();
                    toast('Score Group Successfully Added');
                }, function(error){});
            }, function(error){
                console.log(error);
            });
        }
    }
    /** end add score group **/
    
    /** set active score group **/
    $scope.setActiveScoreGroup = function(score_group_id){
        $scope.active_score_group = Factory.getScoreGroup(score_group_id);
        $scope.active_score_group_structures = Factory.getScoreGroupStructures_(score_group_id);
    }
    try{
        $scope.setActiveScoreGroup($scope.score_groups[0].score_group_id);
    }catch(e){
        console.log(e.message);
    }
    /** end set active score group **/
    
    /** add score group structure **/
    $scope.show_add_score_group_structure_overlay = function(){
        $('#add-score-group-structure-overlay').show();
    }
    $scope.addScoreGroupStructure = function(){
        if($('#form-add-score-group-structure').smkValidate()){
            show_loading_overlay();
            hide_form_modal('add-score-group-structure-overlay', '');
            $scope.score_group_structure.school_id = Factory.getSchoolID();
            $scope.score_group_structure.score_group_id = $scope.active_score_group.score_group_id;
            Service.addScoreGroupStructure($scope.score_group_structure).then(function(response){
                Service.getScoreGroupStructures().then(function(response){
                    Factory.updateScoreGroupStructures(response.data);
                    $scope.score_group_structures = response.data;
                    $scope.setActiveScoreGroup($scope.active_score_group.score_group_id);
                    clear_form_fields('form-add-score-group-structure');
                    hide_loading_overlay();
                    toast('Pattern Successfully Added');
                }, function(error){});
            }, function(error){
                console.log(error);
            });
        }
    }
    /** end add score group structure **/
    
    
    /** CLASS TIMING SET **/
    
    /** add class timing set **/
    $scope.addClassTimingSet = function(){
        if($('#form-add-class-timing-set').smkValidate()){
            show_loading_overlay();
            $scope.class_timing_set.school_id = Factory.getSchoolID();
            Service.addClassTimingSet($scope.class_timing_set).then(function(response){
                Service.getClassTimingSets().then(function(response){
                    Factory.updateClassTimingSets(response.data);
                    $scope.class_timing_sets = response.data;
                    clear_form_fields('form-add-class-timing-set');
                    hide_loading_overlay();
                    toast('Class Timing Successfully Added');
                }, function(error){});
            }, function(error){
                console.log(error);
            });
        }
    }
    /** end add score group **/
    
    /*** subject ***/
    
    /** add subject **/
    $scope.show_add_subject_overlay = function(){
        $('#add-subject-overlay').show();
    }
    $scope.addSubject = function(){
        if($('#form-add-subject').smkValidate()){
            show_loading_overlay();
            hide_form_modal('add-subject-overlay', '');
            $scope.subject.school_id = Factory.getSchoolID();
            Service.addSubject($scope.subject).then(function(response){
                Service.getSubjects().then(function(response){
                    Factory.updateSubjects(response.data);
                    $scope.subjects = response.data;
                    clear_form_fields('form-add-subject');
                    hide_loading_overlay();
                    toast('Subject Successfully Added');
                }, function(error){});
            }, function(error){
                console.log(error);
            });
        }
    }
    /** end add subject **/
    
    /** CLASS PERIOD **/
    
    /** set active class period **/
    $scope.setActiveClassTimingSet = function(class_timing_set_id){
        $scope.active_class_timing_set = Factory.getClassTimingSet(class_timing_set_id);
        $scope.active_class_periods = Factory.getActiveClassPeriods(class_timing_set_id);
    }
    try{
        $scope.setActiveClassTimingSet($scope.class_timing_sets[0].class_timing_set_id);
    }catch(e){
        console.log(e.message);
    }
    /** end set active score group **/
    
    /** add score group structure **/
    $scope.show_add_class_period_overlay = function(){
        $('#add-class-period-overlay').show();
    }
    $scope.addClassPeriod = function(){
        if($('#form-add-class-period').smkValidate()){
            show_loading_overlay();
            hide_form_modal('add-class-period-overlay', '');
            $scope.class_period.school_id = Factory.getSchoolID();
            $scope.class_period.class_timing_set_id = $scope.active_class_timing_set.class_timing_set_id;//$scope.active_score_group.score_group_id;
            Service.addClassPeriod($scope.class_period).then(function(response){
                Service.getClassPeriods().then(function(response){
                    Factory.updateClassPeriods(response.data);
                    $scope.class_periods = response.data;
                    $scope.setActiveClassTimingSet($scope.active_class_timing_set.class_timing_set_id);
                    clear_form_fields('form-add-class-period');
                    hide_loading_overlay();
                    toast('Period Successfully Added');
                }, function(error){});
            }, function(error){
                console.log(error);
            });
        }
    }
    /** end add score group structure **/
    
    /** WEEKDAY CLASS PERIODS **/
    
    /*** add/remove weekday class period **/
    $scope.toggleWeekdayClassPeriod = function(weekday_class_period, status){
        var data = {};
        show_loading_overlay();
        if(status){
            data.class_timing_id = $('#class_timing_'+weekday_class_period.weekday.weekday_id).val();
            if(data.class_timing_id == "? undefined:undefined ?"){
                toast("Select Class Timing Set");
                hide_loading_overlay();
                return;
            } 
            data.class_id = $scope.classs.class_id;
            data.school_id = Factory.getSchoolID();
            data.weekday_id = weekday_class_period.weekday.weekday_id;
            Service.addWeekdayClassPeriod(data).then(function(response){
                Service.getWeekdayClassPeriods().then(function(response){
                    Factory.updateWeekdayClassPeriods(response.data);
                    $scope.class_weekday_periods = Factory.getClassWeekdayPeriods_($scope.classs.class_id);
                    hide_loading_overlay();
                }, function(error){});
            }, function(error){});
        }else{
            data.class_id = $scope.classs.class_id;
            data.school_id = Factory.getSchoolID();
            data.weekday_id = weekday_class_period.weekday.weekday_id;
            Service.deleteWeekdayClassPeriod(data.class_id, data.weekday_id).then(function(response){
                Service.getWeekdayClassPeriods().then(function(response){
                    Factory.updateWeekdayClassPeriods(response.data);
                    $scope.class_weekday_periods = Factory.getClassWeekdayPeriods_($scope.classs.class_id);
                    hide_loading_overlay();
                }, function(error){});
            }, function(error){});
        }
    }
    
    
    
});












app.controller('HRSettingsCtrl', function($scope, Factory, Service, employee_departments, employee_categories, employee_positions, employee_grade_levels){
    
    $scope.factory = Factory;
    
    $scope.employee_departments = employee_departments.data;
    
    $scope.employee_categories = employee_categories.data;
    
    $scope.employee_positions = employee_positions.data;
    
    $scope.employee_grade_levels = employee_grade_levels.data;
    
    $scope.additional_fields = Factory.getAdditionalFields();
    
    $scope.employee_department = {};
    
    $scope.employee_category = {};
    
    $scope.employee_position = {};
    
    $scope.employee_grade_level = {};
    
    
    /*
     * Employee Department 
     */
    
    /** add department **/
    
    $scope.show_add_dept_overlay = function(){
        $('#add-department-overlay').show();
    }
    
    $scope.addEmpDepartment = function(){
        if($('#form-add-employee-department').smkValidate()){
            hide_form_modal('add-department-overlay', '');
            show_loading_overlay();
            $scope.employee_department.school_id = Factory.getSchoolID();
            Service.addEmpDepartment($scope.employee_department).then(function(response){
                Service.getEmpDepartments($scope.employee_department.school_id).then(function(response){
                    $scope.employee_departments = response.data;
                    Factory.updateEmpDepartments(response.data);
                    clear_form_fields('form-add-employee-department');
                    hide_loading_overlay();
                    toast('Department Successfully Added');
                }, function(error){
                    console.log(error);
                });
            }, function(error){
                console.log(error);
            });
        }
    };
    /** end add department **/
    
    
    /**
     * Employee Position
     */
    
    /** add employee category **/
    $scope.addEmpCategory = function(){
        if($('#form-add-employee-category').smkValidate()){
            show_loading_overlay();
            $scope.employee_category.school_id = Factory.getSchoolID();
            Service.addEmpCategory($scope.employee_category).then(function(response){
                Service.getEmpCategories().then(function(response){
                    Factory.updateEmpCategories(response.data);
                    $scope.employee_categories = response.data;
                    clear_form_fields('form-add-employee-category');
                    hide_loading_overlay();
                    toast('Category Successfully Added');
                }, function(error){});
            }, function(error){
                console.log(error);
            });
        }
    }
    /** end add employee category **/
    
    
    
    /** add employee position **/
    $scope.show_add_position_overlay = function(){
        $('#add-position-overlay').show();
    }
    $scope.addEmpPosition = function(){
        if($('#form-add-employee-position').smkValidate()){
            hide_form_modal('add-position-overlay', '');
            show_loading_overlay();
            $scope.employee_position.school_id = Factory.getSchoolID();
            $scope.employee_position.employee_category_id = $scope.active_employee_category.employee_category_id;
            Service.addEmpPosition($scope.employee_position).then(function(response){
                Service.getEmpPositions(Factory.getSchoolID()).then(function(response){
                    $scope.employee_positions = response.data;
                    Factory.updateEmpPositions(response.data);
                    clear_form_fields('form-add-employee-position');
                    $scope.setActiveEmpCategory($scope.active_employee_category.employee_category_id);
                    hide_loading_overlay();
                    toast('Position Successfully Added');
                }, function(error){
                    console.log(error);
                });
            }, function(error){
                console.log(error);
            });
        }
    };
    /** end add employee position **/
    
    /** set active category **/
    $scope.setActiveEmpCategory = function(employee_category_id){
        $scope.active_employee_category = Factory.getEmpCategory(employee_category_id);
        $scope.active_employee_positions = Factory.getEmpCategoryPositions(employee_category_id);
    }
    try{
        $scope.setActiveEmpCategory($scope.employee_categories[0].employee_category_id);
    }catch(e){
        console.log(e.message);
    }
    
    
    /*
     * Employee Grade Level
    */
   /** add grade level **/
    
    $scope.show_add_grade_level_overlay = function(){
        $('#add-grade-level-overlay').show();
    }
    
    $scope.addEmpGradeLevel = function(){
        if($('#form-add-employee-grade-level').smkValidate()){
            hide_form_modal('add-grade-level-overlay', '');
            show_loading_overlay();
            $scope.employee_grade_level.school_id = Factory.getSchoolID();
            Service.addEmpGradeLevel($scope.employee_grade_level).then(function(response){
                Service.getEmpGradeLevels($scope.employee_grade_level.school_id).then(function(response){
                    $scope.employee_grade_levels = response.data;
                    Factory.updateEmpGradeLevels(response.data);
                    clear_form_fields('form-add-employee-grade-level');
                    hide_loading_overlay();
                    toast('Grade Level Successfully Added');
                }, function(error){
                    console.log(error);
                });
            }, function(error){
                console.log(error);
            });
        }
    };
    /** end grade level **/
    
    
});





