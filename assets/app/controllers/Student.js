app.controller('StudentsCtrl', function($scope, $state, Factory, Service, students){
    
    $scope.factory = Factory;
    
    $scope.state = $state;
    
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
            if($scope.mtd == 'card-guardian'){
                if($('#parent_name_').val().trim().length == 0){
                    toastr.error("Kindly specify guardian");
                    return; 
                }
            }else if($scope.mtd == 'card-sib'){
                if($('#parent_id_').val().trim().length == 0){
                    toastr.error("Kindly select sibling");
                    return; 
                }
            }
            
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
    }
    
    
    /** Sibling form iss **/
    $scope.sib;
    $scope.setClassLevels = function(class_type_id){
        $scope.sib.class_levels = Factory.getClassTypeLevels(class_type_id);
        $scope.sib.classes = [];
        $scope.sib.class_students = [];
    }
    
    $scope.setLevelClasses = function(level_id){
        $scope.sib.classes = Factory.getLevelClasses(level_id);
        $scope.sib.class_students = [];
    }
    
    $scope.setClassStudents = function(class_id){
        show_loading_overlay();
        Service.getClassStudents(class_id).then(function(response){
            $scope.sib.class_students = response.data;
            hide_loading_overlay();
        }, function(error){});
    }
    
    $scope.setStudentGuardian = function(student){
        student = JSON.parse(student);
        $scope.sib.guardian = student;
    }
    
    $scope.mtd = 'card-guardian';
    $scope.slideGuardianForm = function(mtd){
        showSlideCard('slide-sibs-guardian', mtd);
    }
    
    /** Sibling form iss **/
    
    
});






app.controller('ViewStudentCtrl', function($scope, $state, Factory, Service, student){
    
    $scope.factory = Factory;
    
    $scope.student = student.data;
    
});

