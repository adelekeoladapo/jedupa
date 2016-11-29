var app = angular.module("jedupa", ['ui.router', 'datatables']);



/** Factory **/
app.factory('Factory', function(){
    
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
    
    /** academic department **/
    data.getStudentDepartments = function(){
        return app_data.student_departments;
    };
    
    data.updateStudentDepartments = function(dt){
        app_data.student_departments = dt;
    };
    
    /** class **/
    data.getClasses = function(){
        return app_data.classes;
    };
    
    data.updateClasses = function(dt){
        app_data.classes = dt;
    };
    
    data.getClass = function(id){
        var dt = {};
        angular.forEach(app_data.classes, function(value, key, obj){
            if(value.class_id == id){
                dt = angular.copy(obj[key]);
            }
        });
        return dt;
    };
    
    /** class levels **/
    data.getClassLevels = function(){
        return app_data.class_levels;
    };
    
    data.updateLevels = function(dt){
        app_data.class_levels = dt;
    };
    
    data.getLevelClasses = function(level_id){
        var dt = [];
        angular.forEach(app_data.classes, function(value, key, obj){
            if(value.level_id == level_id){
                dt.push(angular.copy(obj[key]));
            }
        });
        return dt;
    };
    
    data.getLevel = function(id){
        var dt = {};
        angular.forEach(app_data.class_levels, function(value, key, obj){
            if(value.class_level_id == id){
                dt = angular.copy(obj[key]);
            }
        });
        return (dt) ? dt : null;
    };
    
    /** class types **/
    data.getClassTypes = function(){
        return app_data.class_types;
    };
    
    data.updateClassTypes = function(dt){
        app_data.class_types = dt;
    };
    
    data.updateClassTypes = function(dt){
        app_data.class_types = dt;
    };
    
    data.getClassType = function(id){
        var dt = {};
        angular.forEach(app_data.class_types, function(value, key, obj){
            if(value.class_type_id == id){
                dt = angular.copy(obj[key]);
            }
        });
        return dt;
    };
    
    data.getClassTypeLevels = function(class_type_id){
        var dt = [];
        angular.forEach(app_data.class_levels, function(value, key, obj){
            if(value.class_type_id == class_type_id){
                dt.push(angular.copy(obj[key]));
            }
        });
        return dt;
    }
    
    
    /**  session **/
    data.getSessions = function(){
        return app_data.sessions;
    };
    
    data.updateSessions = function(dt){
        app_data.sessions = dt;
    };
    
    data.getSession = function(id){
        var dt = {};
        angular.forEach(app_data.sessions, function(value, key, obj){
            if(value.session_id == id){
                dt = angular.copy(obj[key]);
            }
        });
        return dt;
    };
    
    
    
    /**  quota **/
    data.getQuotas = function(){
        return app_data.quotas;
    };
    
    data.updateQuotas = function(dt){
        app_data.quotas = dt;
    };
    
    data.getSessionQuotas = function(session_id){
        var dt = [];
        angular.forEach(app_data.quotas, function(value, key, obj){
            if(value.session_id == session_id){
                dt.push(angular.copy(obj[key]));
            }
        });
        return dt;
    }
    
    /** score group **/
    data.getScoreGroups = function(){
        return app_data.score_groups;
    }
    
    data.updateScoreGroups = function(dt){
        app_data.score_groups = dt;
    }
    
    data.getScoreGroup = function(id){
        var dt = {};
        angular.forEach(app_data.score_groups, function(value, key, obj){
            if(value.score_group_id == id){
                dt = angular.copy(obj[key]);
            }
        });
        return dt;
    };
    
    data.getScoreGroupStructures_ = function(score_group_id){
        var dt = [];
        angular.forEach(app_data.score_group_structures, function(value, key, obj){
            if(value.score_group_id == score_group_id){
                dt.push(angular.copy(obj[key]));
            }
        });
        return dt;
    }
    
    data.getScoreGroupStructures = function(){
        return app_data.score_group_structures;
    }
    
    data.updateScoreGroupStructures = function(dt){
        app_data.score_group_structures = dt;
    }
    
     /** student category **/
    data.getStudentCategories = function(){
        return app_data.student_categories;
    }
    
    data.updateStudentCategories = function(dt){
        app_data.student_categories = dt;
    }
    
    data.getStudentCategory = function(id){
        var dt = {};
        angular.forEach(app_data.student_categories, function(value, key, obj){
            if(value.student_category_id == id){
                dt = angular.copy(obj[key]);
            }
        });
        return dt;
    };
    
    
    /** additional field **/
    data.getAdditionalFields = function(type = false){
        if(!type){
            return app_data.additional_fields;
        }else{
            var dt = [];
            angular.forEach(app_data.additional_fields, function(value, key, obj){
                if(value.type == type){
                    dt.push(angular.copy(obj[key]));
                }
            });
            return dt;
        }
    }
    
    data.updateAdditionalFields = function(dt){
        app_data.additional_fields = dt;
    }
    
    data.getAdditionalField = function(id){
        var dt = {};
        angular.forEach(app_data.additional_fields, function(value, key, obj){
            if(value.additional_field_id == id){
                dt = angular.copy(obj[key]);
            }
        });
        return dt;
    };
    
    /** employee department **/
    data.getEmpDepartments = function(){
        return app_data.employee_departments;
    }
    
    data.updateEmpDepartments = function(dt){
        app_data.employee_departments = dt;
    }
    
    /** employee categories **/
    data.getEmpCategories = function(){
        return app_data.employee_categories;
    }
    
    data.updateEmpCategories = function(dt){
        app_data.employee_categories = dt;
    }
    
    data.getEmpCategory = function(id){
        var dt = {};
        angular.forEach(app_data.employee_categories, function(value, key, obj){
            if(value.employee_category_id == id){
                dt = angular.copy(obj[key]);
            }
        });
        return dt;
    };
    
    data.getEmpCategoryPositions = function(employee_category_id){
        var dt = [];
        angular.forEach(app_data.employee_positions, function(value, key, obj){
            if(value.employee_category_id == employee_category_id){
                dt.push(angular.copy(obj[key]));
            }
        });
        return dt;
    }
    
    /** employee positions **/
    data.getEmpPositions = function(){
        return app_data.employee_positions;
    }
    
    data.updateEmpPositions = function(dt){
        app_data.employee_positions = dt;
    }
    
    /** employee grade level **/
    data.getEmpGradeLevels = function(){
        return app_data.employee_grade_levels;
    }
    
    data.updateEmpGradeLevels = function(dt){
        app_data.employee_grade_levels = dt;
    }
    
    
    
    
    
    
    
    
    /** 
     *  UTILITIES
    **/
    
    /** 2016-06-17 14:35:32 to July 17. 2016 **/
    data.formatDate_1 = function(date){
        var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        date = date.split(" ")[0].split("-");
        return months[date[1]-1]+" "+date[2]+", "+date[0];
    };
    
    /** 2016-06-17 14:35:32 to July 17. 2016 at 16:00 **/
    data.formatDate_2 = function(date){
        var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        d = date.split(" ");
        date = d[0].split("-");
        return months[date[1]-1]+" "+date[2]+", "+date[0]+" at "+d[1];
    }
    
    
    return data;
    
});


/*
 * App Services
 */
app.service('Service', function($http){
    
    this.loadAppData = function(school_id){
        return $http.get(base_url+"api/init-app", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    }
    
    /** school **/
    this.getSchool = function(id){
        return $http({
            method: "POST",
            url: base_url+"api/get-school",
            data : "school-id="+id,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        });
    };
    
    /** state **/
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
    
    /** academic department **/
    this.addDept = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-student-dept",
            data: data
        });
    };
    
    this.getSchoolDepts = function(school_id){
        return $http.get(base_url+"api/get-school-depts", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    /** class **/
    this.addClass = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-class",
            data: data
        });
    };
    
    this.getClasses = function(school_id){
        return $http.get(base_url+"api/get-school-classes", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    /** class level **/
    this.addLevel = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-class-level",
            data: data
        });
    };
    
    this.getLevels = function(school_id){
        return $http.get(base_url+"api/get-class-levels", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    /** class type **/
    this.addClassType = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-class-type",
            data: data
        });
    };
    
    this.getClassTypes = function(school_id){
        return $http.get(base_url+"api/get-class-types", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    /** session **/
    this.addSession = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-session",
            data: data
        });
    };
    
    this.getSessions = function(school_id){
        return $http.get(base_url+"api/get-sessions", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    /** quota **/
    this.addQuota = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-quota",
            data: data
        });
    };
    
    this.getQuotas = function(school_id){
        return $http.get(base_url+"api/get-quotas", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    /** score group **/
    this.addScoreGroup = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-score-group",
            data: data
        });
    };
    
    this.getScoreGroups = function(school_id){
        return $http.get(base_url+"api/get-score-groups", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    this.addScoreGroupStructure = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-score-group-structure",
            data: data
        });
    };
    
    this.getScoreGroupStructures = function(school_id){
        return $http.get(base_url+"api/get-score-group-structures", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    /** student category **/
    this.addStudentCategory = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-student-category",
            data: data
        });
    };
    
    this.getStudentCategories = function(school_id){
        return $http.get(base_url+"api/get-student-categories", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    /** additional field **/
    this.addAdditionalField = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-additional-field",
            data: data
        });
    };
    
    this.getAdditionalFields = function(school_id){
        return $http.get(base_url+"api/get-additional-fields", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    /** employee department **/
    this.addEmpDepartment = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-employee-department",
            data: data
        });
    };
    
    this.getEmpDepartments = function(school_id){
        return $http.get(base_url+"api/get-employee-departments", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    /** employee category **/
    this.addEmpCategory = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-employee-category",
            data: data
        });
    };
    
    this.getEmpCategories = function(school_id){
        return $http.get(base_url+"api/get-employee-categories", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    /** employee position **/
    this.addEmpPosition = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-employee-position",
            data: data
        });
    };
    
    this.getEmpPositions = function(school_id){
        return $http.get(base_url+"api/get-employee-positions", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    /** employee grade level **/
    this.addEmpGradeLevel = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-employee-grade-level",
            data: data
        });
    };
    
    this.getEmpGradeLevels = function(school_id){
        return $http.get(base_url+"api/get-employee-grade-levels", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
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
        
        .state('new-student', {
            url: "/new-student",
            templateUrl: "assets/app/views/new-student.html",
            controller: "NewStudentCtrl",
            resolve: {
                states: function(Service){
                    return Service.getStates();
                }
            }
        })
        
        .state('general-settings', {
            url: "/general-settings",
            templateUrl: "assets/app/views/general-settings.html",
            controller: "GeneralSettingsCtrl",
            resolve: {
                states: function(Service){
                    return Service.getStates();
                },
                school: function(Service, Factory){
                    return Service.getSchool(Factory.getSchoolID());
                }
            }
        })
        
        .state('academic-settings', {
            url: "/academic-settings",
            templateUrl: "assets/app/views/academic-settings.html",
            controller: "AcademicSettingsCtrl",
            resolve: {
                departments: function(Service, Factory){
                    return Service.getSchoolDepts(Factory.getSchoolID());
                },
                classes: function(Service, Factory){
                    return Service.getClasses(Factory.getSchoolID());
                },
                sessions: function(Service, Factory){
                    return Service.getSessions(Factory.getSchoolID());
                }
            }
        })
        
        .state('hr-settings', {
            url: "/hr-settings",
            templateUrl: "assets/app/views/hr-settings.html",
            controller: "HRSettingsCtrl",
            resolve: {
                employee_departments: function(Service, Factory){
                    return Service.getEmpDepartments(Factory.getSchoolID());
                },
                employee_categories: function(Service, Factory){
                    return Service.getEmpCategories(Factory.getSchoolID());
                },
                employee_positions: function(Service, Factory){
                    return Service.getEmpPositions(Factory.getSchoolID());
                },
                employee_grade_levels: function(Service, Factory){
                    return Service.getEmpGradeLevels(Factory.getSchoolID());
                }
            }
        });
    
});


/*
 * App Controller
 */
app.controller('mainCtrl', function($rootScope, Factory, Service){
    
    /** Init App Data **/
    Service.loadAppData(Factory.getSchoolID()).then(function(response){
        Factory.setAppData(response.data);
    }, function(error){
        console.log(error);
    });
    
    
    
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
