app.controller('GeneralSettingsCtrl', function($scope, Session, states, school){
    
    $scope.session = Session;
    
    $scope.states = states.data;
    
    $scope.school = school.data;
    
    $scope.app_data = $scope.session.getAppData();
    
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

app.controller('AcademicSettingsCtrl', function($scope, Service, Session, departments){
    
    Session.updateStudentDepartments(departments.data);
    
    $scope.departments = Session.getStudentDepartments();
    
    $scope.dept = {};
    
    $scope.addAcademicDept = function(){
        if($('#form-add-student-dept').smkValidate()){
            show_loading_overlay();
            $scope.dept.school_id = Session.getSchoolID();
            Service.addDept($scope.dept).then(function(response){
                Service.getSchoolDepts($scope.dept.school_id).then(function(response){
                    $scope.departments = response.data;
                    Session.updateStudentDepartments(response.data);
                    showCard('card-all-dept');
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
    
    
});












app.controller('HRSettingsCtrl', function($scope){
    
});

