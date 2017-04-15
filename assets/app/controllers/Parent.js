app.controller('ParentsCtrl', function($scope, $state, Factory, Service, parents){
    
    $scope.factory = Factory;
    
    $scope.state = $state;
    
    $scope.parents = parents.data;
    
});



app.controller('ViewParentCtrl', function($scope, $state, Factory, Service, parent, children){
    
    $scope.factory = Factory;
    
    $scope.parent = parent.data;
    
    $scope.children = children.data;
    
    
});