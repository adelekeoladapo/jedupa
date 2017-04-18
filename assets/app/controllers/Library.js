/** Settings **/

app.controller('LibrarySettingsCtrl', function($scope, $state, Factory, Service, book_categories, book_genres){
    
    $scope.factory = Factory;
    
    $scope.book_categories = book_categories.data;
    
    $scope.book_genres = book_genres.data;
    
    $scope.book_category = {};
    
    $scope.book_genre = {};
    
    /** add book category **/
    $scope.show_add_book_category_overlay = function(){
        $('#add-book-category-overlay').fadeIn(300);
    }
    $scope.addBookCategory = function(){
        if($('#form-add-book-category').smkValidate()){
            hide_form_modal('add-book-category-overlay', '');
            show_loading_overlay();
            $scope.book_category.school_id = Factory.getSchoolID();
            Service.addBookCategory($scope.book_category).then(function(response){
                Service.getBookCategories($scope.book_category.school_id).then(function(response){
                    $scope.book_categories = response.data;
                    clear_form_fields('form-add-book-category');
                    hide_loading_overlay();
                    toastr.success('Successfully Added');
                }, function(error){
                    console.log(error);
                });
            }, function(error){
                console.log(error);
            });
        }
    }
    /** end add book category **/
    
    
    /** add book genre **/
    $scope.show_add_book_genre_overlay = function(){
        $('#add-book-genre-overlay').fadeIn(300);
    }
    $scope.addBookGenre = function(){
        if($('#form-add-book-genre').smkValidate()){
            hide_form_modal('add-book-genre-overlay', '');
            show_loading_overlay();
            $scope.book_genre.school_id = Factory.getSchoolID();
            Service.addBookGenre($scope.book_genre).then(function(response){
                Service.getBookGenres($scope.book_genre.school_id).then(function(response){
                    $scope.book_genres = response.data;
                    clear_form_fields('form-add-book-genre');
                    hide_loading_overlay();
                    toastr.success('Successfully Added');
                }, function(error){
                    console.log(error);
                });
            }, function(error){
                console.log(error);
            });
        }
    }
    /** end add book genre **/
    
});

/** End Settings **/


/** Publisher **/

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





/********* Authors **********/

app.controller('AuthorsCtrl', function($scope, $state, Factory, Service, authors){
    
    $scope.factory = Factory;
    
    $scope.state = $state;
    
    $scope.authors = authors.data;
    
});

app.controller('NewAuthorCtrl', function($scope, $state, Factory, Service){
    
    $scope.factory = Factory;
    
    $scope.state = $state;
    
    /** add publisher **/
    $scope.addAuthor = function(){
        if($('#form-add-author').smkValidate()){
            show_loading_overlay();
            var form_data = new FormData($('#form-add-author')[0]);
            $.ajax({
                type: "POST",
                url: base_url+"api/add-author",
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


app.controller('ViewAuthorCtrl', function($scope, $state, Factory, Service, author){
    
    $scope.factory = Factory;
    
    $scope.state = $state;
    
    $scope.author = author.data;
    
    /** update publisher **/
    $scope.updateAuthor = function(){ 
        if($('#form-update-author').smkValidate()){
            show_loading_overlay();
            var form_data = new FormData($('#form-update-author')[0]);
            $.ajax({
                type: "POST",
                url: base_url+"api/update-author",
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

/********* End Authors **********/



