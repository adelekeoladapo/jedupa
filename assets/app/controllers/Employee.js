app.controller('EmployeesCtrl', function($scope, $scope, Factory, Service, employees){
    
    $scope.factory = Factory;
    
    $scope.employees = employees.data;
    
});



app.controller('NewEmployeeCtrl', function($scope, $state, Factory, Service, states){
    
    $scope.factory = Factory;
    
    $scope.school_id = Factory.getSchoolID();
    
    $scope.employee_departments = Factory.getEmpDepartments();
    
    $scope.employee_categories = Factory.getEmpCategories();
    
    $scope.grade_levels = Factory.getEmpGradeLevels();
    
    $scope.states = states.data;
    
    $scope.additional_fields = Factory.getAdditionalFields('employee');
    
    $scope.user_privileges = Factory.getUserPrivileges();
    
    
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
    
    
    /** add employee **/
    $scope.addEmployee = function(){
        if($('#form-add-employee').smkValidate()){
            show_loading_overlay();
            var form_data = new FormData($('#form-add-employee')[0]);
            $.ajax({
                type: "POST",
                url: base_url+"api/add-employee",
                data: form_data,
                success:function(result, status, xhr){ 
                    result = JSON.parse(result);
                    hide_loading_overlay();
                    if(result.status){
                        $state.reload();
                        toastr.success(result.message);
                    }else{
                        toastr.error(result.message);
                    }
                },
                complete: function(){
                },
                timeout: 50000,
                error: function(){
                    toastr.error("An error occurred. Try again");
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





app.controller('ViewEmployeeCtrl', function($scope, $state, Factory, Service, employee){
    
    $scope.factory = Factory;
    
    $scope.employee = employee.data;
    
});
