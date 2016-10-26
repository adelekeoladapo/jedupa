var app = angular.module("jedupa", ['ui.router', 'datatables']);

/*
 * App factory
 */
app.factory('Factory', function(){
    
});


/** Session **/
app.factory('Session', function(){
    
    var data = {};
    
    var app_data = {};
    
    data.getSchoolID = function(){
        return "1";
    };
    
    data.setAppData = function(data){
        app_data = data;
    };
    
    data.getAppData = function(){
        return app_data;
    };
    
    return data;
    
});


/*
 * App Services
 */
app.service('Service', function($http){
    
    this.getSchool = function(id){
        return $http({
            method: "POST",
            url: base_url+"api/get-school",
            data : "school-id="+id,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
    };
    
    this.getStates = function(){
        return $http.get(base_url+"api/get-states");
    };
    
    this.getState = function(id){
        return $http.get({
            method: "POST",
            url: base_url+"api/get-state",
            data : "state-id="+id,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
    };
    
    this.addDept = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-student-dept",
            data: data
        });
    }
    
    this.getSchoolDepts = function(school_id){
        return $http.get(base_url+"api/add-get-school-depts", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    }
    
});


/*
 * App Config
 */
app.config(function($stateProvider, $urlRouterProvider){
    
    $urlRouterProvider.otherwise("/dashboard");
    
    $stateProvider
    
        .state('dashboard', {
            url: "/dashboard",
            templateUrl: "assets/app/views/dashboard.html"
        })
        
        .state('students', {
            url: "/students",
            templateUrl: "assets/app/views/students.html",
            controller: "StudentsCtrl"
        })
        
        .state('general-settings', {
            url: "/general-settings",
            templateUrl: "assets/app/views/general-settings.html",
            controller: "GeneralSettingsCtrl",
            resolve: {
                states: function(Service){
                    return Service.getStates();
                },
                school: function(Service, Session){
                    return Service.getSchool(Session.getSchoolID());
                }
            }
        })
        
        .state('academic-settings', {
            url: "/academic-settings",
            templateUrl: "assets/app/views/academic-settings.html",
            controller: "AcademicSettingsCtrl"
        })
        
        .state('hr-settings', {
            url: "/hr-settings",
            templateUrl: "assets/app/views/hr-settings.html",
            controller: "HRSettingsCtrl"
        });
    
});


/*
 * App Controller
 */
app.controller('mainCtrl', function($rootScope, $http, Service){
    
    $rootScope.$on('$stateChangeStart', function(event, toState, toParams, fromState, fromParams, options){ 
        show_loading_overlay();
    });
    
    
    $rootScope.$on('$stateChangeError', function(event, toState, toParams, fromState, fromParams, error){ 
        hide_loading_overlay();
        toast('No Internet Access');
    });
    
    
    $rootScope.$on('$stateChangeSuccess', function(event, toState, toParams, fromState, fromParams){ 
        hide_loading_overlay();
    });
    
});
