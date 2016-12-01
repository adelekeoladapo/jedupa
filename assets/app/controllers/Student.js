app.controller('StudentsCtrl', function($scope, $scope, students){
    
    $scope.students = students.data;
    
});


app.controller('NewStudentCtrl', function($scope, $state, Factory, Service, states){
    
    $scope.factory = Factory;
    
    $scope.departments = Factory.getStudentDepartments();
    
    $scope.categories = Factory.getStudentCategories();
    
    $scope.class_levels = Factory.getClassLevels();
    
    $scope.class_types = Factory.getClassTypes();
    
    $scope.classes = Factory.getClasses();
    
    $scope.states = states.data;
    
    $scope.additional_fields = Factory.getAdditionalFields('student');
    
    $scope.school_id = Factory.getSchoolID();
    
    
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
    
    /** add student **/
    $scope.addStudent = function(){
        if($('#form-add-student').smkValidate()){
            show_loading_overlay();
            var form_data = new FormData($('#form-add-student')[0]);
            $.ajax({
                type: "POST",
                url: base_url+"api/add-student",
                data: form_data,
                success:function(result, status, xhr){ 
                    result = JSON.parse(result);
                    hide_loading_overlay();
                    if(result.status){
                        $state.reload();
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
    }
    
});






app.controller('ViewStudentCtrl', function($scope, $state, Factory, Service, student){
    
    $scope.student = student.data;
    
});

