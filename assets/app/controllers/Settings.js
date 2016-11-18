app.controller('GeneralSettingsCtrl', function($scope, Factory, states, school){
    
    $scope.factory = Factory;
    
    $scope.states = states.data;
    
    $scope.school = school.data;
    
    $scope.app_data = $scope.factory.getAppData();
    
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
    
});


/*******************Academic Settings Controller ***************/

app.controller('AcademicSettingsCtrl', function($scope, Factory, Service, departments, classes, sessions){
    
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
    
    $scope.dept = {};
    
    $scope.classs = {};
    
    $scope.class_level = {};
    
    $scope.class_type = {};
    
    $scope.session = {};
    
    $scope.quota = {};
     
    
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
            $scope.setActiveLevel($scope.active_class_type_levels[0].class_level_id);
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
    $scope.addSession = function(){
        if($('#form-add-session').smkValidate()){
            show_loading_overlay();
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
    
    /** add quota **/
    $scope.addQuota = function(){
        if($('#form-add-quota').smkValidate()){
            show_loading_overlay();
            $scope.quota.school_id = Factory.getSchoolID();
            Service.addQuota($scope.quota).then(function(response){
                Service.getQuotas().then(function(response){
                    Factory.updateQuotas(response.data);
                    $scope.quotas = response.data;
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
    
    
    
    $scope.t_id = 1;
    
    $scope.test = function(){
        $scope.t_id++;
    }
    
    
});












app.controller('HRSettingsCtrl', function($scope){
    
});

