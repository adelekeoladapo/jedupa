app.controller('TimetableCtrl', function($scope, $scope, Factory, Service, class_types, employees, subjects){
    
    $scope.factory = Factory;
    
    $scope.default_quota = $scope.$parent.default_quota;
    
    $scope.class_types = class_types.data;
    
    $scope.class_levels = [];
    
    $scope.classes = [];
    
    $scope.employees = employees.data;
    
    $scope.subjects = subjects.data;
    
    $scope.classs = {};
    
    $scope.employee = {};
    
    $scope.subject = {};
    
    /** set class levels **/
    $scope.setClassLevels = function(class_type_id){
        $scope.class_levels = Factory.getClassTypeLevels(class_type_id);
    }
    
    /** set classes **/
    $scope.setClasses = function(class_level_id){
        $scope.classes = Factory.getLevelClasses(class_level_id);
    }
    
    /** set timetable **/
    $scope.setTimetable = function(class_id){
        $scope.classs = Factory.getClass(class_id);
        $scope.basic_class_subjects = Factory.getBasicClassSubjects(class_id);
        $scope.class_weekday_periods = Factory.getClassWeekdayPeriods_(class_id);
    }
    
    /** CLASS TIMETABLES **/
    
    /*** add class weekdays periods subjects **/
    $scope.new_periods = {};
    $scope.addClassWeekdaysPeriodsSubjects = function(){ 
        $scope.new_periods.class_id = $scope.classs.class_id;
        $scope.new_periods.school_id = Factory.getSchoolID();
        $scope.new_periods.quota_id = $scope.default_quota.quota_id;
        $scope.new_periods.session_id = $scope.default_quota.session_id;
        $scope.new_periods.periods = period_tray;
        if(!$scope.new_periods.subject_id){
            toast("Kindly select a subject");
        }else if($scope.new_periods.periods.length < 1){
            toast("No period selected");
        }else{
            show_loading_overlay();
            Service.addClassWeekdaysPeriodsSubjects($scope.new_periods).then(function(response){
                Service.getClassTimetables(Factory.getSchoolID(), $scope.default_quota).then(function(response){
                    Factory.updateClassTimeTables(response.data);
                    $scope.class_weekday_periods = Factory.getClassWeekdayPeriods_($scope.classs.class_id);
                    period_tray = [];
                    //update class basic subjects
                    Service.getClassSubjects(Factory.getSchoolID(), $scope.default_quota).then(function(response){
                        Factory.updateBasicClassSubjects(response.data);
                    }, function(error){});
                    hide_loading_overlay();
                    toast($scope.new_periods.periods.length+" periods added successfully");
                }, function(error){});
            }, function(error){});
        }
    }
    
    $scope.resetClassTimetablePeriods = function(){ 
        var periods = period_tray;
        if(periods.length < 1){
            toast("No period selected");
        }else{
            var c = confirm("Reset Periods?");
            if(c){
                var data = {};
                data.class_id = $scope.classs.class_id;
                data.school_id = Factory.getSchoolID();
                data.quota_id = $scope.default_quota.quota_id;
                data.periods = periods;
                show_loading_overlay();
                Service.removeClassWeekdaysPeriodsSubjects(data).then(function(response){
                    Service.getClassTimetables(Factory.getSchoolID(), $scope.default_quota).then(function(response){
                        Factory.updateClassTimeTables(response.data);
                        $scope.class_weekday_periods = Factory.getClassWeekdayPeriods_($scope.classs.class_id);
                        period_tray = [];
                        //update class basic subjects
                        Service.getClassSubjects(Factory.getSchoolID(), $scope.default_quota).then(function(response){
                            Factory.updateBasicClassSubjects(response.data);
                        }, function(error){});
                        hide_loading_overlay();
                        toast(periods.length+" periods reset successfully");
                    }, function(error){});
                }, function(error){});
            }
        }
    }
    
    /** add/remove period from period tray while making timetable **/
    var period_tray = [];
    $scope.togglePeriods = function(data, status){
        if(status){
            period_tray.push(data);
        }else{
            $scope.remove_period_from_tray(data);
        }
    }
    
    $scope.remove_period_from_tray = function(period){
        for(d in period_tray){
            if((period_tray[d].weekday_id == period.weekday_id)&&(period_tray[d].class_period_id == period.class_period_id)){
                period_tray.splice(d, 1);
            }
        }
    }
    
    /** reset class timetable **/
    $scope.resetClassWeekdaysPeriodsSubjects = function(){ 
        var c = confirm("Reset Timetable?")
        if(c){
            show_loading_overlay();
            Service.resetClassTimetable($scope.classs.class_id, $scope.default_quota.quota_id).then(function(response){
                Service.getClassTimetables(Factory.getSchoolID(), $scope.default_quota).then(function(response){
                    Factory.updateClassTimeTables(response.data);
                    $scope.class_weekday_periods = Factory.getClassWeekdayPeriods_($scope.classs.class_id);
                    //update class basic subjects
                    Service.getClassSubjects(Factory.getSchoolID(), $scope.default_quota).then(function(response){
                        Factory.updateBasicClassSubjects(response.data);
                    }, function(error){});
                    hide_loading_overlay();
                    toast("Timetable reset successfully");
                }, function(error){});
            }, function(error){});
        }
    }
    
});




app.controller('TimetableSettingsCtrl', function($scope, $scope, Factory, Service, class_timing_sets, class_types){
    
    $scope.factory = Factory;
    
    Factory.updateClassTimingSets(class_timing_sets.data);
    
    $scope.class_timing_sets = Factory.getClassTimingSets();
    
    $scope.class_periods = Factory.getClassPeriods();
    
    $scope.class_types = class_types.data;
    
    $scope.class_levels = [];
    
    $scope.classes = [];
    
    $scope.classs = {};
    
    $scope.class_timing_set = {};
    
    $scope.class_period = {};
    
    $scope.default_quota = $scope.$parent.default_quota;
    
    /** add class timing set **/
    $scope.addClassTimingSet = function(){
        if($('#form-add-class-timing-set').smkValidate()){
            show_loading_overlay();
            $scope.class_timing_set.school_id = Factory.getSchoolID();
            Service.addClassTimingSet($scope.class_timing_set).then(function(response){
                Service.getClassTimingSets(Factory.getSchoolID()).then(function(response){
                    Factory.updateClassTimingSets(response.data);
                    $scope.class_timing_sets = response.data;
                    clear_form_fields('form-add-class-timing-set');
                    hide_loading_overlay();
                    toast('Class Timing Successfully Added');
                }, function(error){});
            }, function(error){
                console.log(error);
            });
        }
    }
    /** end add score group **/
    
    /** CLASS PERIOD **/
    
    /** set active class period **/
    $scope.setActiveClassTimingSet = function(class_timing_set_id){
        $scope.active_class_timing_set = Factory.getClassTimingSet(class_timing_set_id);
        $scope.active_class_periods = Factory.getActiveClassPeriods(class_timing_set_id);
    }
    try{
        $scope.setActiveClassTimingSet($scope.class_timing_sets[0].class_timing_set_id);
    }catch(e){
        console.log(e.message);
    }
    /** end set active score group **/
    
    
    /** set active class period **/
    $scope.setActiveClassTimingSet = function(class_timing_set_id){
        $scope.active_class_timing_set = Factory.getClassTimingSet(class_timing_set_id);
        $scope.active_class_periods = Factory.getActiveClassPeriods(class_timing_set_id);
    }
    try{
        $scope.setActiveClassTimingSet($scope.class_timing_sets[0].class_timing_set_id);
    }catch(e){
        console.log(e.message);
    }
    /** end set active score group **/
    
    /** add score group structure **/
    $scope.show_add_class_period_overlay = function(){
        $('#add-class-period-overlay').show();
    }
    $scope.addClassPeriod = function(){
        if($('#form-add-class-period').smkValidate()){
            show_loading_overlay();
            hide_form_modal('add-class-period-overlay', '');
            $scope.class_period.school_id = Factory.getSchoolID();
            $scope.class_period.class_timing_set_id = $scope.active_class_timing_set.class_timing_set_id;//$scope.active_score_group.score_group_id;
            Service.addClassPeriod($scope.class_period).then(function(response){
                Service.getClassPeriods(Factory.getSchoolID()).then(function(response){
                    Factory.updateClassPeriods(response.data);
                    $scope.class_periods = response.data;
                    $scope.setActiveClassTimingSet($scope.active_class_timing_set.class_timing_set_id);
                    clear_form_fields('form-add-class-period');
                    hide_loading_overlay();
                    toast('Period Successfully Added');
                }, function(error){});
            }, function(error){
                console.log(error);
            });
        }
    }
    /** end add score group structure **/
    
    
    
    /** WEEKDAY CLASS-TIMING **/
    
    /** set class levels **/
    $scope.setClassLevels = function(class_type_id){
        $scope.class_levels = Factory.getClassTypeLevels(class_type_id);
    }
    
    /** set classes **/
    $scope.setClasses = function(class_level_id){
        $scope.classes = Factory.getLevelClasses(class_level_id);
    }
    
    /** set class weekday timing set **/
    $scope.setClassWeekdayTimingSets = function(class_id){
        $scope.classs = Factory.getClass(class_id);
        $scope.class_weekday_periods = Factory.getClassWeekdayPeriods_(class_id);
    }
    
    /*** add/remove weekday class period **/
    $scope.toggleWeekdayClassPeriod = function(weekday_class_period, status){ 
        var data = {};
        show_loading_overlay();
        if(status){
            data.class_timing_id = $('#class_timing_'+weekday_class_period.weekday.weekday_id).val();
            if(data.class_timing_id == "? undefined:undefined ?"){
                toast("Select Class Timing Set");
                hide_loading_overlay();
                return;
            } 
            data.class_id = $scope.classs.class_id;
            data.school_id = Factory.getSchoolID();
            data.weekday_id = weekday_class_period.weekday.weekday_id;
            data.session_id = $scope.default_quota.session_id;
            data.quota_id = $scope.default_quota.quota_id;
            Service.addWeekdayClassPeriod(data).then(function(response){
                Service.getWeekdayClassPeriods(Factory.getSchoolID(), $scope.default_quota).then(function(response){
                    Factory.updateWeekdayClassPeriods(response.data);
                    $scope.class_weekday_periods = Factory.getClassWeekdayPeriods_($scope.classs.class_id);
                    hide_loading_overlay();
                }, function(error){});
            }, function(error){});
        }else{
            data.class_id = $scope.classs.class_id;
            data.school_id = Factory.getSchoolID();
            data.weekday_id = weekday_class_period.weekday.weekday_id;
            data.session_id = $scope.default_quota.session_id;
            data.quota_id = $scope.default_quota.quota_id;
            Service.deleteWeekdayClassPeriod(data.class_id, data.weekday_id, data.quota_id).then(function(response){
                Service.getWeekdayClassPeriods(Factory.getSchoolID(), $scope.default_quota).then(function(response){
                    Factory.updateWeekdayClassPeriods(response.data);
                    $scope.class_weekday_periods = Factory.getClassWeekdayPeriods_($scope.classs.class_id);
                    Service.getClassTimetables(Factory.getSchoolID(), $scope.default_quota).then(function(response){
                        Factory.updateClassTimeTables(response.data);
                        $scope.class_weekday_periods = Factory.getClassWeekdayPeriods_($scope.classs.class_id);
                        hide_loading_overlay();
                    }, function(error){});
                }, function(error){});
            }, function(error){});
        }
        
        
        
    }
    
    
});

