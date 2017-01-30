<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	http://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] = 'jedupa';
$route['login'] = 'user/login';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

$route['api/init-app'] = 'Jedupa/init';

/******** School APIs *****************/
$route['api/get-school'] = 'School/getSchool';
$route['api/update-school'] = 'School/updateSchool';

/************* State APIs ******************/
$route['api/get-states'] = 'State/getStates';

/************* Academic Department APIs ***************/
$route['api/add-student-dept'] = 'StudentDepartment/addDept';
$route['api/get-school-depts'] = 'StudentDepartment/getDepts';

/************* Class APIs *************************/
$route['api/add-class'] = 'Classs/addClass';
$route['api/get-school-classes'] = 'Classs/getClasses';
$route['api/add-class-level'] = 'Classs/addLevel';
$route['api/get-class-levels'] = 'Classs/getLevels';
$route['api/add-class-type'] = 'Classs/addType';
$route['api/get-class-types'] = 'Classs/getTypes';

/************ Session APIs **********************/
$route['api/add-session'] = 'Session/addSession';
$route['api/get-sessions'] = 'Session/getSessions';

/************ Quota APIs **********************/
$route['api/add-quota'] = 'Quota/addQuota';
$route['api/get-quotas'] = 'Quota/getQuotas';
$route['api/update-quota'] = 'Quota/updateQuota';

/*********** Grading Levels APIs ****************/
$route['api/add-grading-level'] = 'GradingLevel/addGradingLevel';
$route['api/get-grading-levels'] = 'GradingLevel/getGradingLevels';
$route['api/add-grading-level-structure'] = 'GradingLevel/addGradingLevelStructure';
$route['api/get-grading-level-structures'] = 'GradingLevel/getGradingLevelStructures';

/*********** Class Designation APIs ****************/
$route['api/add-class-designation'] = 'ClassDesignation/addClassDesignation';
$route['api/get-class-designations'] = 'ClassDesignation/getClassDesignations';
$route['api/add-class-designation-structure'] = 'ClassDesignation/addClassDesignationStructure';
$route['api/get-class-designation-structures'] = 'ClassDesignation/getClassDesignationStructures';

/************* Student Category APIs ***************/
$route['api/add-student-category'] = 'StudentCategory/addStudentCategory';
$route['api/get-student-categories'] = 'StudentCategory/getStudentCategories';

/************* Additional Field APIs ***************/
$route['api/add-additional-field'] = 'AdditionalField/addAdditionalField';
$route['api/get-additional-fields'] = 'AdditionalField/getAdditionalFields';

/************* Employee Department APIs ***************/
$route['api/add-employee-department'] = 'EmpDepartment/addEmpDepartment';
$route['api/get-employee-departments'] = 'EmpDepartment/getEmpDepartments';

/************* Employee Position APIs ***************/
$route['api/add-employee-position'] = 'EmpPosition/addEmpPosition';
$route['api/get-employee-positions'] = 'EmpPosition/getEmpPositions';

/************* Employee Category APIs ***************/
$route['api/add-employee-category'] = 'EmpCategory/addEmpCategory';
$route['api/get-employee-categories'] = 'EmpCategory/getEmpCategories';

/************* Employee Grade Level APIs ***************/
$route['api/add-employee-grade-level'] = 'EmpGradeLevel/addEmpGradeLevel';
$route['api/get-employee-grade-levels'] = 'EmpGradeLevel/getEmpGradeLevel';

/************* Student APIs ***************/
$route['api/add-student'] = 'User/addStudent';
$route['api/get-students'] = 'User/getStudents';
$route['api/get-student'] = 'User/getStudent';

/************* Parent APIs ****************/
$route['api/get-parents'] = 'User/getParents';
$route['api/get-parent'] = 'User/getParent';

/************* Employee APIs ****************/
$route['api/add-employee'] = 'User/addEmployee';
$route['api/get-employees'] = 'User/getEmployees';
$route['api/get-employee'] = 'User/getEmployee';

/************* Subject APIs ****************/
$route['api/add-subject'] = 'Subject/addSubject';
$route['api/get-subjects'] = 'Subject/getSubjects';
$route['api/get-subject'] = 'User/getSubject';
$route['api/assign-class-subjects'] = 'Subject/assignClassSubjects';
$route['api/assign-class-subject'] = 'Subject/assignClassSubject';
$route['api/get-class-subjects'] = 'Subject/getClassBasicSubjects';
$route['api/delete-class-subject'] = 'Subject/deleteClassBasicSubject';

/************* ClassTimingSet APIs ****************/
$route['api/add-class-timing-set'] = 'ClassTimingSet/addClassTimingSet';
$route['api/get-class-timing-sets'] = 'ClassTimingSet/getClassTimingSets';

/************* ClassPeriod APIs ****************/
$route['api/add-class-period'] = 'ClassPeriod/addClassPeriod';
$route['api/get-class-periods'] = 'ClassPeriod/getClassPeriods';

/************* WeekdayClassPeriod APIs ****************/
$route['api/add-weekday-class-period'] = 'ClassPeriod/addWeekdayClassPeriod';
$route['api/get-weekday-class-periods'] = 'ClassPeriod/getWeekdayClassPeriods';
$route['api/delete-weekday-class-period'] = 'ClassPeriod/deleteWeekdayClassPeriod';

/************* ClassTimetable APIs ****************/
$route['api/add-class-timetable'] = 'ClassTimetable/addClassTimetable';
$route['api/get-class-timetable'] = 'ClassTimetable/getClassTimetables';
$route['api/add-class-weekdays-periods-subjects'] = 'ClassTimetable/addClassWeekdaysPeriodsSubjects';   
$route['api/reset-class-timetable'] = 'ClassTimetable/resetClassTimetable'; 
$route['api/remove-class-timetable-periods'] = 'ClassTimetable/removeClassWeekdaysPeriodsSubjects';

/************* Examination APIs ****************/
$route['api/add-examination'] = 'Examination/addExamination';
$route['api/get-examinations'] = 'Examination/getExaminations';
$route['api/update-examinations'] = 'Examination/updateExaminations';
$route['api/create-class-exam-timetable'] = 'Examination/createClassExamTimetable';
$route['api/get-class-exam-timetables'] = 'Examination/getExamTimetables';
$route['api/connect-exams'] = 'Examination/connectExaminations';
$route['api/get-examination-groups'] = 'Examination/getExaminationGroups';


/************* User Privilege APIs ****************/
$route['api/add-user-privilege'] = 'UserPrivilege/addUserPrivilege';
$route['api/get-user-privileges'] = 'UserPrivilege/getUserPrivileges';
$route['api/add-user-privilege-modules'] = 'UserPrivilege/insertUserPrivilegeModules';
$route['api/get-user-privilege-modules'] = 'UserPrivilege/getUserPrivilegeModules';