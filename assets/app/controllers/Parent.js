app.controller('ParentsCtrl', function($scope, $scope, Factory, Service, parents){
    
    $scope.factory = Factory;
    
    $scope.parents = parents.data;
    
});



app.controller('ViewParentCtrl', function($scope, $scope, Factory, Service, parent, children){
    
    $scope.factory = Factory;
    
    $scope.parent = parent.data;
    
    $scope.children = children.data;
    
    
});