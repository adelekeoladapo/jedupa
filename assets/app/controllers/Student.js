app.controller('StudentsCtrl', function($scope){
    
    
    
});


app.controller('NewStudentCtrl', function($scope, Factory, Service){
    
    $scope.factory = Factory;
    
    $scope.app_data = Factory.getAppData();
    
    $scope.departments = Factory.getStudentDepartments();
    
    $scope.class_types = Factory.getClassTypes();
    
    console.log($scope.departments);
    
});


