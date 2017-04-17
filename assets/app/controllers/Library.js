app.controller('PublishersCtrl', function($scope, $state, Factory, Service, publishers){
    
    $scope.factory = Factory;
    
    $scope.state = $state;
    
    $scope.publishers = publishers.data;
    
});

app.controller('NewPublisherCtrl', function($scope, $state, Factory, Service){
    
    $scope.factory = Factory;
    
    $scope.state = $state;
    
    /** add publisher **/
    $scope.addPublisher = function(){
        if($('#form-add-publisher').smkValidate()){
            show_loading_overlay();
            var form_data = new FormData($('#form-add-publisher')[0]);
            $.ajax({
                type: "POST",
                url: base_url+"api/add-publisher",
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


app.controller('ViewPublisherCtrl', function($scope, $state, Factory, Service, publisher){
    
    $scope.factory = Factory;
    
    $scope.state = $state;
    
    $scope.publisher = publisher.data;
    
    /** update publisher **/
    $scope.updatePublisher = function(){ 
        if($('#form-update-publisher').smkValidate()){
            show_loading_overlay();
            var form_data = new FormData($('#form-update-publisher')[0]);
            $.ajax({
                type: "POST",
                url: base_url+"api/update-publisher",
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