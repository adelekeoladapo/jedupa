app.controller('StudentsCtrl', function($scope){
    
    
    
});


app.controller('NewStudentCtrl', function($scope, Factory, Service){
    
    $scope.factory = Factory;
    
    $scope.app_data = Factory.getAppData();
    
    $scope.departments = Factory.getStudentDepartments();
    
    $scope.class_types = Factory.getClassTypes();
    
    $scope.classes = Factory.getClasses();
    
    console.log($scope.classes);
    
    $scope.test = function(){
        console.log($scope.factory.getClasses());
    }
    
});


