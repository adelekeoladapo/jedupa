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
    
    data.getBasicClassSubjects = function(class_id){
        var dt = [];
        angular.forEach(app_data.classes_basic_subjects, function(value, key, obj){
            if(value.class_id == class_id){
                dt.push(angular.copy(obj[key]));
            }
        });
        return dt;
    };
    
    data.updateBasicClassSubjects = function(dt){
        app_data.classes_basic_subjects = dt;
    };
    
    data.getBasicClassSubjectsArr = function(class_id){
        var dt = [];
        angular.forEach(app_data.classes_basic_subjects, function(value, key, obj){
            if(value.class_id == class_id){
                dt.push(obj[key].subject_id);
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
    data.getDefaultQuota = function(){
        return app_data.default_quota;
    }
    
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
    
    data.getQuota = function(id){
        var dt = {};
        angular.forEach(app_data.quotas, function(value, key, obj){
            if(value.quota_id == id){
                dt = angular.copy(obj[key]);
            }
        });
        return dt;
    }
    
    
    /** grading level **/
    data.getGradingLevels = function(){
        return app_data.grading_levels;
    }
    
    data.updateGradingLevels = function(dt){
        app_data.grading_levels = dt;
    }
    
    data.getGradingLevel = function(id){
        var dt = {};
        angular.forEach(app_data.grading_levels, function(value, key, obj){
            if(value.grading_level_id == id){
                dt = angular.copy(obj[key]);
            }
        });
        return dt;
    };
    
    data.getGradingLevelStructures_ = function(grading_level_id){
        var dt = [];
        angular.forEach(app_data.grading_level_structures, function(value, key, obj){
            if(value.grading_level_id == grading_level_id){
                dt.push(angular.copy(obj[key]));
            }
        });
        return dt;
    }
    
    data.getGradingLevelStructures = function(){
        return app_data.grading_level_structures;
    }
    
    data.updateGradingLevelStructures = function(dt){
        app_data.grading_level_structures = dt;
    }
    
    /** class designation **/
    data.getClassDesignations = function(){
        return app_data.class_designations;
    }
    
    data.updateClassDesignations = function(dt){
        app_data.class_designations = dt;
    }
    
    data.getClassDesignation = function(id){
        var dt = {};
        angular.forEach(app_data.class_designations, function(value, key, obj){
            if(value.class_designation_id == id){
                dt = angular.copy(obj[key]);
            }
        });
        return dt;
    };
    
    data.getClassDesignationStructures_ = function(class_designation_id){
        var dt = [];
        angular.forEach(app_data.class_designation_structures, function(value, key, obj){
            if(value.class_designation_id == class_designation_id){
                dt.push(angular.copy(obj[key]));
            }
        });
        return dt;
    }
    
    data.getClassDesignationStructures = function(){
        return app_data.class_designation_structures;
    }
    
    data.updateClassDesignationStructures = function(dt){
        app_data.class_designation_structures = dt;
    }
    
    /** class timing set **/
    data.getClassTimingSets = function(){
        return app_data.class_timing_sets;
    }
    
    data.updateClassTimingSets = function(dt){
        app_data.class_timing_sets = dt;
    }
    
    data.getClassTimingSet = function(id){
        var dt = {};
        angular.forEach(app_data.class_timing_sets, function(value, key, obj){
            if(value.class_timing_set_id == id){
                dt = angular.copy(obj[key]);
            }
        });
        return dt;
    };
    
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
    
    /**  students **/
    data.getStudents = function(){
        return app_data.students;
    }
    
    data.updateStudents = function(dt){
        app_data.students = dt;
    }
    
    /**  parents **/
    data.getParents = function(){
        return app_data.parents;
    }
    
    /**  students **/
    data.getSubjects = function(){
        return app_data.subjects;
    }
    
    data.updateSubjects = function(dt){
        app_data.subjects = dt;
    }
    
    data.getSubject = function(id){
        var dt = {};
        angular.forEach(app_data.subjects, function(value, key, obj){
            if(value.subject_id == id){
                dt = angular.copy(obj[key]);
            }
        });
        return dt;
    }
    
    /**  Class Periods **/
    data.getClassPeriods = function(){
        return app_data.class_periods;
    }
    
    data.updateClassPeriods = function(dt){
        app_data.class_periods = dt;
    }
    
    
    data.getActiveClassPeriods = function(class_timing_set_ids){
        var dt = [];
        angular.forEach(app_data.class_periods, function(value, key, obj){
            if(value.class_timing_set_id == class_timing_set_ids){
                dt.push(angular.copy(obj[key]));
            }
        });
        return dt;
    }
    
    data.getClassTimingSetPeriods = function(id){
        var dt = [];
        angular.forEach(app_data.class_periods, function(value, key, obj){
            if(value.class_timing_set_id == id){
                dt.push(angular.copy(obj[key]));
            }
        });
        return dt;
    };
    
    /**  weekday **/
    data.getWeekdays = function(){
        return app_data.weekdays;
    }
    
    data.updateWeekdays = function(dt){
        app_data.weekdays = dt;
    }
    
    /**  weekday_class_periods  **/
    data.getWeekdayClassPeriods = function(){
        return app_data.weekday_class_periods;
    }
    
    data.updateWeekdayClassPeriods = function(dt){
        app_data.weekday_class_periods = dt;
    }
    
    data.getWeekdayClassWeekdayPeriod = function(class_id, weekday_id){
        var dt = {};
        angular.forEach(app_data.weekday_class_periods, function(value, key, obj){
            if(value.class_id == class_id && value.weekday_id == weekday_id){
                dt = angular.copy(obj[key]);
            }
        });
        return dt;
    }
    
    data.getClassWeekdayPeriods = function(class_id){
        var dt = [];
        angular.forEach(app_data.weekday_class_periods, function(value, key, obj){
            if(value.class_id == class_id){
                dt.push(angular.copy(obj[key]));
            }
        });
        return dt;
    }
    
    data.getClassWeekdayPeriods_ = function(class_id){
        var dt = [];
        angular.forEach(app_data.weekdays, function(value, key, obj){
            var d = {};
            d.weekday = value;
            var info = data.getWeekdayClassWeekdayPeriod(class_id, value.weekday_id);
            d.info = (info) ? info : false;
            if(info){
                d.periods = data.getClassTimingSetPeriods(info.class_timing_id);
            }
            info = false;
            dt.push(d);
        });
        return dt;
    }
    
    /** class timetable **/
    data.getClassTimeTables = function(){
        return app_data.class_timetables;
    }
    
    data.updateClassTimeTables = function(dt){
        app_data.class_timetables = dt;
    }
    
    data.getClassWeekdayPeriodTimetable = function(class_id, weekday_id, class_period_id){
        dt = {};
        angular.forEach(app_data.class_timetables, function(value, key, obj){
            if((value.class_id == class_id)&&(value.weekday_id == weekday_id)&&(value.class_period_id == class_period_id)){
                dt = angular.copy(obj[key]);
            }else{
                return false
            }
        });
        return dt;
    }
    
    /** class examination **/
    data.getClassQuotaExams = function(class_id, quota_id){
        var dt = [];
        angular.forEach(app_data.examinations, function(value, key, obj){
            if((value.quota_id == quota_id) && (value.class_id == class_id)){
                dt.push(angular.copy(obj[key]));
            }
        });
        return dt;
    }
    
    data.updateExaminations = function(dt){
        app_data.examinations = dt;
    }
    
    data.getExamination = function(id){
        var dt = {};
        angular.forEach(app_data.examinations, function(value, key, obj){
            if(value.examination_id == id){
                dt = angular.copy(obj[key]);
            }
        });
        return dt;
    }
    
    data.updateClassQuotaContinuousAssessment = function(dt){
        app_data.class_quota_continuous_assessments = dt;
    }
    
    data.getClassSubjectContinuousAssessments = function(subject_id){
        var dt = [];
        angular.forEach(app_data.class_quota_continuous_assessments, function(value, key, obj){
            if(value.subject_id == subject_id){
                dt.push(angular.copy(obj[key]));
            }
        });
        return dt;
    }
    
    data.getContinuousAssessment = function(student_id, exam_id, subject_id){
        var dt = {};
        angular.forEach(app_data.class_quota_continuous_assessments, function(value, key, obj){
            if(value.student_id == student_id && value.examination_id == exam_id && value.subject_id == subject_id){
                dt = angular.copy(obj[key]);
            }
        });
        return dt;
    }
    
    
    
    /** class examination group **/
    
    data.getExaminationGroup = function(class_id, quota_id){
        var dt = {};
        angular.forEach(app_data.examination_groups, function(value, key, obj){
            if((value.class_id == class_id)&&(value.quota_id == quota_id)){
                dt = angular.copy(obj[key]);
            }
        });
        return dt;
    }
    
    data.updateExaminationGroups = function(dt){
        app_data.examination_groups = dt;
    }
    
    
    
    /** class exam timetables **/
    data.getClassQuotaExamTimetable = function(class_id, exam_id){
        var dt = [];
        angular.forEach(app_data.classes_basic_subjects , function(value, key, obj){
            if(value.class_id == class_id){
                var d = {};
                d.subject = value;
                var timetable_info = data.getQuotaClassSubjectExamTimetable(value.subject_id, exam_id);
                d.timetable_info = (timetable_info) ? timetable_info : false;
                dt.push(d);
            }
        });
        return dt;
    }
    
    data.getQuotaClassSubjectExamTimetable = function(subject_id, examination_id){
        var dt = false;
        angular.forEach(app_data.examination_timetables, function(value, key, obj){
            if((value.subject_id == subject_id) && (value.examination_id == examination_id)){
                dt = {};
                dt = angular.copy(obj[key]);
            }
        });
        return dt;
    }
    
    data.getExamTimetable = function(examination_id){
        var dt = [];
        angular.forEach(app_data.examination_timetables, function(value, key, obj){
            if(value.examination_id == examination_id){
                dt.push(angular.copy(obj[key]));
            }
        });
        return dt;
    }
    
    data.updateExamTimetable = function(dt){
        app_data.examination_timetables = dt;
    }
    
    /** user privilege **/
    
    data.getUserPrivileges = function(){
        return app_data.user_privileges;
    }
    
    data.updateUserPrivileges = function(dt){
        app_data.user_privileges = dt;
    }
    
    data.getUserPrivilege = function(id){
        var dt = {};
        angular.forEach(app_data.user_privileges, function(value, key, obj){
            if(value.user_privilege_id == id){
                dt = angular.copy(obj[key]);
            }
        });
        return dt;
    }
    
    /** privilege modules **/
    data.getPrivilegeChildModules = function(id){
        var dt = [];
        angular.forEach(app_data.privilege_modules, function(value, key, obj){
            if(value.parent_id == id){
                dt.push(angular.copy(obj[key]));
            }
        });
        return dt;
    }
    
    /** system modules **/
    
    data.getSystemModules = function(){
        return app_data.system_modules;
    }
    
    data.getUserPrivilegeModules_ = function(privilege_id){
        var dt = [];
        angular.forEach(app_data.user_privilege_modules, function(value, key, obj){
            if(value.user_privilege_id == privilege_id){
                dt.push(angular.copy(obj[key]));
            }
        });
        return dt;
    }
    
    data.updateUserPrivilegeModules = function(dt){
        app_data.user_privilege_modules = dt;
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
    
    /** Abbreviate weekday eg Monday = Mon **/
    data.abr_week_day = function(weekday){
        return weekday.substring(0, 3);
    }
    
    data.break_str = function(str){
        var d = "";
        var arr = str.split("");
        for(s of arr){
            d += s+"\n";
        }
        return d;
    }

    
    
    return data;
    
});


/*
 * App Services
 */
app.service('Service', function($http){
    
    this.loadAppData = function(school_id, session_id, quota_id){
        return $http.get(base_url+"api/init-app", {
            params : {'filter-field': 'school_id', 'filter-value': school_id, 'session-id': session_id, 'quota-id': quota_id}
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
    
    /** grading level **/
    this.addGradingLevel = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-grading-level",
            data: data
        });
    };
    
    this.getGradingLevels = function(school_id){
        return $http.get(base_url+"api/get-grading-levels", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    this.addGradingLevelStructure = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-grading-level-structure",
            data: data
        });
    };
    
    this.getGradingLevelStructures = function(school_id){
        return $http.get(base_url+"api/get-grading-level-structures", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    /** class designation **/
    this.addClassDesignation = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-class-designation",
            data: data
        });
    };
    
    this.getClassDesignations = function(school_id){
        return $http.get(base_url+"api/get-class-designations", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    this.addClassDesignationStructure = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-class-designation-structure",
            data: data
        });
    };
    
    this.getClassDesignationStructures = function(school_id){
        return $http.get(base_url+"api/get-class-designation-structures", {
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
    
    /** student **/
    this.getStudents = function(school_id){
        return $http.get(base_url+"api/get-students", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    this.getClassStudents = function(class_id){
        return $http.get(base_url+"api/get-students", {
            params : {'filter-field': 'class_id', 'filter-value': class_id}
        });
    };
    
    this.getStudent = function(id){
        return $http.get(base_url+"api/get-student", {
            params : {'student_id' : id}
        });
    };
    
    /** parent **/
    this.getParents = function(school_id){
        return $http.get(base_url+"api/get-parents", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    this.getParent = function(id){
        return $http.get(base_url+"api/get-parent", {
            params : {'parent_id' : id}
        });
    };
    
    this.getChildren = function(parent_id){
        return $http.get(base_url+"api/get-students", {
            params : {'filter-field': 'parent_id', 'filter-value': parent_id}
        });
    };
    
    /** employee **/
    this.getEmployees = function(school_id){
        return $http.get(base_url+"api/get-employees", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    this.getEmployee = function(id){
        return $http.get(base_url+"api/get-employee", {
            params : {'employee_id' : id}
        });
    };
    
    /** subject **/
    this.addSubject = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-subject",
            data: data
        });
    };
    
    this.getSubjects = function(school_id){
        return $http.get(base_url+"api/get-subjects", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    this.getSubject = function(id){
        return $http.get(base_url+"api/get-subject", {
            params : {'subject_id' : id}
        });
    };
    
    this.assignClassSubjects = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/assign-class-subjects",
            data: data
        });
    }
    
    this.assignClassSubject = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/assign-class-subject",
            data: data
        });
    }
    
    this.getClassSubjects = function(school_id, quota){
        return $http.get(base_url+"api/get-class-subjects", {
            params : {'filter-field': 'school_id', 'filter-value': school_id, 'quota': quota}
        });
    };
    
    this.deleteClassSubject = function(id){
        return $http.get(base_url+"api/delete-class-subject", {
            params : {'class-subject-id' : id}
        });
    }
    
    /** class timing set **/
    this.addClassTimingSet = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-class-timing-set",
            data: data
        });
    };
    
    this.getClassTimingSets = function(school_id){
        return $http.get(base_url+"api/get-class-timing-sets", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    /** class period **/
    this.addClassPeriod = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-class-period",
            data: data
        });
    };
    
    this.getClassPeriods = function(school_id){
        return $http.get(base_url+"api/get-class-periods", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    /** add-weekday-class-period **/
    this.addWeekdayClassPeriod = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-weekday-class-period",
            data: data
        });
    };
    
    this.getWeekdayClassPeriods = function(school_id, quota){
        return $http.get(base_url+"api/get-weekday-class-periods", {
            params : {'filter-field': 'school_id', 'filter-value': school_id, 'quota': quota}
        });
    };
    
    this.deleteWeekdayClassPeriod = function(class_id, weekday_id, quota_id){
        return $http.get(base_url+"api/delete-weekday-class-period", {
            params : {'weekday-id' : weekday_id, 'class-id' : class_id, 'quota-id': quota_id}
        });
    }
    
    /** class timetables **/
    this.addClassWeekdaysPeriodsSubjects = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-class-weekdays-periods-subjects",
            data: data
        });
    };
    
    this.getClassTimetables = function(school_id, quota){
        return $http.get(base_url+"api/get-class-timetable", {
            params : {'filter-field': 'school_id', 'filter-value': school_id, 'quota': quota}
        });
    };
    
    this.resetClassTimetable = function(class_id, quota_id){
        return $http.get(base_url+"api/reset-class-timetable", {
            params : {'class-id' : class_id, 'quota-id': quota_id}
        });
    }
    
    this.removeClassWeekdaysPeriodsSubjects = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/remove-class-timetable-periods",
            data: data
        });
    };
    
    /** class examination **/
    this.addExamination = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-examination",
            data: data
        });
    };
    
    this.getExaminations = function(school_id){
        return $http.get(base_url+"api/get-examinations", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    this.createClassExamTimetable = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/create-class-exam-timetable",
            data: data
        });
    };
    
    this.getExaminationTimetables = function(school_id, quota){
        return $http.get(base_url+"api/get-class-exam-timetables", {
            params : {'filter-field': 'school_id', 'filter-value': school_id, 'quota': quota}
        });
    }
    
    this.connectExaminations = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/connect-exams",
            data: data
        });
    };
    
    this.getExaminationGroups = function(school_id){
        return $http.get(base_url+"api/get-examination-groups", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    this.saveContinuousAssessment = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/save-continuous-assessment",
            data: data
        });
    }
    
    this.getClassQuotaContinuousAssessment = function(school_id, quota, class_id){
        return $http.get(base_url+"api/get-class-quota-continuous-assessment", {
            params : {'filter-field': 'school_id', 'filter-value': school_id, 'quota': quota, 'class-id': class_id}
        });
    };
    
    
    
    /** user privilege **/
    this.addUserPrivilege = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-user-privilege",
            data: data
        });
    };
    
    this.getUserPrivileges = function(school_id){
        return $http.get(base_url+"api/get-user-privileges", {
            params : {'filter-field': 'school_id', 'filter-value': school_id}
        });
    };
    
    this.addUserPrivilegeModules = function(data){
        return $http({
            method: "POST",
            url: base_url+"api/add-user-privilege-modules",
            data: data
        });
    };
    
    this.getUserPrivilegeModules = function(school_id){
        return $http.get(base_url+"api/get-user-privilege-modules", {
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
            controller: "StudentsCtrl",
            resolve: {
                students: function(Service, Factory){
                    return Service.getStudents(Factory.getSchoolID());
                }
            }
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
        
        .state('view-student', {
            url: "/view-student/:id",
            templateUrl: "assets/app/views/view-student.html",
                controller: "ViewStudentCtrl",
            resolve: {
                student: function($stateParams, Service){
                    return Service.getStudent($stateParams.id);
                }
            }
        })
        
        .state('parents', {
            url: "/parents",
            templateUrl: "assets/app/views/parents.html",
            controller: "ParentsCtrl",
            resolve: {
                parents: function(Service, Factory){
                    return Service.getParents(Factory.getSchoolID());
                }
            }
        })
        
        .state('view-parent', {
            url: "/view-parent/:id",
            templateUrl: "assets/app/views/view-parent.html",
                controller: "ViewParentCtrl",
            resolve: {
                parent: function($stateParams, Service){
                    return Service.getParent($stateParams.id);
                },
                children: function($stateParams, Service){
                    return Service.getChildren($stateParams.id);
                }
            }
        })
        
        .state('employees', {
            url: "/employees",
            templateUrl: "assets/app/views/employees.html",
            controller: "EmployeesCtrl",
            resolve: {
                employees: function(Service, Factory){
                    return Service.getEmployees(Factory.getSchoolID());
                }
            }
        })
        
        .state('new-employee', {
            url: "/new-employee",
            templateUrl: "assets/app/views/new-employee.html",
            controller: "NewEmployeeCtrl",
            resolve: {
                states: function(Service){
                    return Service.getStates();
                }
            }
        })
        
        .state('view-employee', {
            url: "/view-employee/:id",
            templateUrl: "assets/app/views/view-employee.html",
                controller: "ViewEmployeeCtrl",
            resolve: {
                employee: function($stateParams, Service){
                    return Service.getEmployee($stateParams.id);
                }
            }
        })
        
        .state('timetable-class-timetable', {
            url: "/timetable-class-timetable",
            templateUrl: "assets/app/views/timetable-class-timetable.html",
                controller: "TimetableCtrl",
            resolve: {
                class_types: function(Service, Factory){
                    return Service.getClassTypes(Factory.getSchoolID());
                },
                employees: function(Service, Factory){
                    return Service.getEmployees(Factory.getSchoolID());
                },
                subjects: function(Service, Factory){
                    return Service.getSubjects(Factory.getSchoolID());
                }
            }
        })
        
        .state('timetable-settings', {
            url: "/timetable-settings",
            templateUrl: "assets/app/views/timetable-settings.html",
                controller: "TimetableSettingsCtrl",
            resolve: {
                class_timing_sets: function(Service, Factory){
                    return Service.getClassTimingSets(Factory.getSchoolID());
                },
                class_types: function(Service, Factory){
                    return Service.getClassTypes(Factory.getSchoolID());
                }
            }
        })
        
        .state('examination', {
            url: "/examination",
            templateUrl: "assets/app/views/examination.html",
                controller: "ExaminationCtrl",
            resolve: {
                
            }
        })
        
        .state('examination-settings', {
            url: "/examination-settings",
            templateUrl: "assets/app/views/examination-settings.html",
                controller: "ExaminationCtrl",
            resolve: {
                grading_levels: function(Service, Factory){
                    return Service.getGradingLevels(Factory.getSchoolID());
                },
                class_designations: function(Service, Factory){
                    return Service.getClassDesignations(Factory.getSchoolID());
                },
                class_types: function(Service, Factory){
                    return Service.getClassTypes(Factory.getSchoolID());
                },
                sessions: function(Service, Factory){
                    return Service.getSessions(Factory.getSchoolID());
                }
            }
        })
        
        .state('examination-assessment', {
            url: "/examination-assessment",
            templateUrl: "assets/app/views/examination-assessment.html",
                controller: "ExaminationAssessmentCtrl",
            resolve: {
                class_types: function(Service, Factory){
                    return Service.getClassTypes(Factory.getSchoolID());
                }
            }
        })
        
        .state('result-settings', {
            url: "/result-settings",
            templateUrl: "assets/app/views/result-settings.html",
                controller: "ResultSettingsCtrl",
            resolve: {
                grading_levels: function(Service, Factory){
                    return Service.getGradingLevels(Factory.getSchoolID());
                },
                class_designations: function(Service, Factory){
                    return Service.getClassDesignations(Factory.getSchoolID());
                },
                class_types: function(Service, Factory){
                    return Service.getClassTypes(Factory.getSchoolID());
                },
                sessions: function(Service, Factory){
                    return Service.getSessions(Factory.getSchoolID());
                }
            }
        })
        
        .state('result-class-result', {
            url: "/result-class-result",
            templateUrl: "assets/app/views/result.html",
                controller: "ResultCtrl",
            resolve: {
                class_types: function(Service, Factory){
                    return Service.getClassTypes(Factory.getSchoolID());
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
                },
                employees: function(Service, Factory){
                    return Service.getEmployees(Factory.getSchoolID());
                },
                levels: function(Service, Factory){
                    return Service.getLevels(Factory.getSchoolID());
                },
                class_types: function(Service, Factory){
                    return Service.getClassTypes(Factory.getSchoolID());
                },
                grading_levels: function(Service, Factory){
                    return Service.getGradingLevels(Factory.getSchoolID());
                },
                class_designations: function(Service, Factory){
                    return Service.getClassDesignations(Factory.getSchoolID());
                },
                class_timing_sets: function(Service, Factory){
                    return Service.getClassTimingSets(Factory.getSchoolID());
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
        
//        .state('empty', {});
        
            
    
});


/*
 * App Controller
 */
app.controller('mainCtrl', function($rootScope, $state, Factory, Service){
    
    $rootScope._sessions = [];
    
    $rootScope._quotas = [];
    
    $rootScope.root_factory = Factory;
    /** Init App Data **/
    Service.loadAppData(Factory.getSchoolID(), false, false).then(function(response){
        Factory.setAppData(response.data);
        /** set base privileges with parent_id = 0 **/
        $rootScope.base_modules = Factory.getPrivilegeChildModules(0);
        $rootScope.default_quota = response.data.quotas[response.data.quotas.length-1];
    }, function(error){
        console.log(error);
    });
    
    $rootScope.show_set_default_quota_overlay = function(){
        $('#set-default-quota-overlay').fadeIn(300);
    }
    
    $rootScope._setSessionQuotas = function(session_id){
        $rootScope._quotas = Factory.getSessionQuotas(session_id);
    }
    
    $rootScope.def = {};
    $rootScope._setDefaultQuota = function(){
        if($('#form-set-default-quota').smkValidate() && $rootScope.def.quota_id != null){
            hide_form_modal('set-default-quota-overlay', '');
            show_loading_overlay();
            Service.loadAppData(Factory.getSchoolID(), $rootScope.def.session_id, $rootScope.def.quota_id).then(function(response){
                Factory.setAppData(response.data);
                $rootScope.base_modules = Factory.getPrivilegeChildModules(0);
                $rootScope.default_quota = Factory.getQuota($rootScope.def.quota_id);
                $state.go('dashboard');
                $rootScope.def = {};
                hide_loading_overlay();
                toast("Default Quota Successfully Set");
            }, function(error){});
        }else{
            toast("Select Quota");
        }
    }
    

    
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
