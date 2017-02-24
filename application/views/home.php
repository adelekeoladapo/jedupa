<!DOCTYPE html>
<html lang="en-US" class="app">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Jedupa</title>
    <link rel='stylesheet' id='font-awesome-css'  href='<? echo base_url(); ?>assets/theme/font/font-awesome/css/font-awesome.min.css' type='text/css' />
    <link rel='stylesheet' id='simple-line-icons-css'  href='<? echo base_url(); ?>assets/theme/font/simple-line-icons/css/simple-line-icons1c9b.css' type='text/css' />
    <link rel='stylesheet' id='simple-line-icons-css'  href='<? echo base_url(); ?>assets/lib/ionicons-2.0.1/css/ionicons.min.css' type='text/css' />
    <link rel='stylesheet' id='bootstrap-css'  href='<? echo base_url(); ?>assets/theme/bootstrap/css/bootstrap.min.css' type='text/css' media='all' />
    
    
    
    <link rel='stylesheet' id='bootstrap-css'  href='<? echo base_url(); ?>assets/lib/smoke/css/smoke.min.css' type='text/css' media='all' />
    <link rel='stylesheet' id='app-css'  href='<? echo base_url(); ?>assets/theme/assets/css/app1c9b.css' type='text/css' media='all' />
    <link rel='stylesheet' id='font-css'  href='<? echo base_url(); ?>assets/theme/assets/css/font1c9b.css?ver=4.6.1' type='text/css' media='all' />
    
    <link rel='stylesheet' id='app-css'  href='<? echo base_url(); ?>assets/lib/bootstrap/bootstrap-datepicker-1.6.4-dist/css/bootstrap-datepicker3.min.css' type='text/css' media='all' />
    
    
    <!-- Base url -->
    <script>
        var base_url = "<? echo base_url(); ?>";
    </script>
    <!-- End Base url -->
    
    <!-- JS Links -->
    <script src="<? echo base_url(); ?>assets/lib/jquery/jquery-2.2.1.min.js"></script>
    
    
    <link type="text/css" rel="stylesheet" media="all" href="<? echo base_url(); ?>assets/lib/datatables/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css">
    <link type="text/css" rel="stylesheet" media="all" href="<? echo base_url(); ?>assets/lib/datatables/datatables-responsive/css/dataTables.responsive.css">
    <script type="text/javascript" src="<? echo base_url(); ?>assets/lib/datatables/media/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="<? echo base_url(); ?>assets/lib/datatables/media/js/dataTables.bootstrap.min.js"></script>
    
    
    
    <link rel='stylesheet' id='bootstrap-css'  href='<? echo base_url(); ?>assets/theme/assets/css/ui.css' type='text/css' media='all' />
    <link rel='stylesheet' id='bootstrap-css'  href='<? echo base_url(); ?>assets/theme/assets/css/ui-responsive.css' type='text/css' media='all' />
    
    <script src="<? echo base_url(); ?>assets/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="<? echo base_url(); ?>assets/lib/smoke/js/smoke.min.js"></script>
   
    <script src="<? echo base_url(); ?>assets/lib/bootstrap/bootstrap-datepicker-1.6.4-dist/js/bootstrap-datepicker.min.js"></script>
    
    <script src="<? echo base_url(); ?>assets/lib/imagepreview/src/imagepreview.js"></script>
    <script src="<? echo base_url(); ?>assets/lib/angular/angular.min.js"></script>
    <script src="<? echo base_url(); ?>assets/lib/angular/angular-ui-router.min.js"></script>
    <script src="<? echo base_url(); ?>assets/lib/angular/angular-cookies.js"></script>
    <script src="<? echo base_url(); ?>assets/lib/angular-datatables-master/dist/angular-datatables.js"></script>
    
    
    
    <script src="<? echo base_url(); ?>assets/theme/assets/js/ui.js"></script>
    <script src="<? echo base_url(); ?>assets/app/controllers/Jedupa.js"></script>
    <script src="<? echo base_url(); ?>assets/app/controllers/Settings.js"></script>
    <script src="<? echo base_url(); ?>assets/app/controllers/Student.js"></script>
    <script src="<? echo base_url(); ?>assets/app/controllers/Parent.js"></script>
    <script src="<? echo base_url(); ?>assets/app/controllers/Employee.js"></script>
    <script src="<? echo base_url(); ?>assets/app/controllers/Timetable.js"></script>
    <script src="<? echo base_url(); ?>assets/app/controllers/Examination.js"></script>
    <script src="<? echo base_url(); ?>assets/app/controllers/Result.js"></script>
    
    <!-- JS Links -->
    
    
    
</head>
<body ng-app="jedupa" ng-controller="mainCtrl">
    <section class="vbox">
        
        <!-- Header -->
        <header class="header header-md navbar navbar-fixed-top-xs" ng-include="'assets/app/views/templates/header.html'">
            
        </header>
        <!-- End Header -->
        
        <section>
            <section class="hbox stretch">
                
                <!-- Sidebar -->
                <aside id="nav" class="hidden-xs bg-black dk aside hidden-print" ng-include="'assets/app/views/templates/sidebar.html'">          
                    
                </aside>
                <!-- End Sidebar -->
                
                <section id="content">
                    <a href="javascript:;" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
                    
                    <!-- Body Content -->
                    <div class="jd-content" ui-view>
                        
                        
                        
                    </div>
                    <!-- End Body Content -->
                    
                </section>
            </section>
        </section>
    </section>
    
    <!-- Toast -->
    <div class="toast-container">
        <div class="toast">
            
        </div>
    </div>
    <!-- End Toast -->
    
    <!-- Loading overlay -->
    <div class="transparent-overlay" id="loading-overlay">
        <div class="loading-img">
            <img src="<? echo base_url(); ?>assets/images/system-images/loading.gif">
        </div>
    </div>
    <!-- Loading overlay -->
    
    <!-- Set default quota overlay -->
    <div class="transparent-overlay" id="set-default-quota-overlay">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="jd-modal">
                    <h1 class="h4 m-b-md m-t-none font-normal jd-modal-title">
                        Set Default Quota
                    </h1>
                    <div class="jd-modal-body">
                        <form class="form-horizontal" name="form-set-default-quota" id="form-set-default-quota"  novalidate> 
                            <div class="form-group">
                                <label for="session_id" class="col-sm-4 control-label">Session <span class="required-field"> *</span></label>
                                <div class="col-sm-8">
                                    <select name="session_id" ng-model="def.session_id" ng-change="_setSessionQuotas(def.session_id)" class="form-control" required>
                                        <option value="{{ session.session_id }}" ng-repeat="session in root_factory.getSessions()">{{ session.name }}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="quota_id" class="col-sm-4 control-label">Quota <span class="required-field"> *</span></label>
                                <div class="col-sm-8">
                                    <select name="quota_id" class="form-control" ng-model="def.quota_id" required>
                                        <option value="{{ quota.quota_id }}" ng-repeat="quota in _quotas">{{ quota.name }}</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="jd-modal-footer">
                        <button class="btn jd-modal-btn" onclick="hide_form_modal('set-default-quota-overlay', '')">Cancel</button>
                        <button class="btn jd-modal-btn btn-ok" ng-click="_setDefaultQuota()">OK</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Set default quota overlay -->

</body>

</html>

