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

app.controller('AcademicSettingsCtrl', function($scope, Factory, Service, departments, classes){
    
    $scope.factory = Factory;
    
    Factory.updateStudentDepartments(departments.data);
    
    Factory.updateClasses(classes.data);
    
    $scope.departments = Factory.getStudentDepartments();
    
    $scope.classes = Factory.getClasses();
    
    $scope.class_levels = Factory.getClassLevels();
    
    $scope.dept = {};
    
    $scope.classs = {};
    
    $scope.class_level = {};
    
     
    
    /** add department **/
    $scope.addAcademicDept = function(){
        if($('#form-add-student-dept').smkValidate()){
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
    $scope.addClass = function(){
        if($('#form-add-class').smkValidate()){
            show_loading_overlay();
            $scope.classs.school_id = Factory.getSchoolID();
            Service.addClass($scope.classs).then(function(response){
                Service.getClasses(Factory.getSchoolID()).then(function(response){
                    $scope.classes = response.data;
                    Factory.updateClasses(response.data);
                    clear_form_fields('form-add-class');
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
    
    /** add class level **/
    $scope.addClassLevel = function(){
        if($('#form-add-class-level').smkValidate()){
            show_loading_overlay();
            $scope.class_level.school_id = Factory.getSchoolID();
            Service.addLevel($scope.class_level).then(function(response){
                Service.getLevels().then(function(response){
                    Factory.updateLevels(response.data);
                    $scope.class_levels = response.data;
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
    
    $scope.test = function(){
        alert('Hello world');
    }
    
    
});












app.controller('HRSettingsCtrl', function($scope){
    
});

