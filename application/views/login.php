<!DOCTYPE html>
<html>
    <head>
        <title>Login | Jedupa</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel='stylesheet' id='font-awesome-css'  href='<? echo base_url(); ?>assets/theme/font/font-awesome/css/font-awesome.min.css' type='text/css' />
        <link rel='stylesheet' id='bootstrap-css'  href='<? echo base_url(); ?>assets/theme/bootstrap/css/bootstrap.min.css' type='text/css' media='all' />
        <link rel="stylesheet" type="text/css" href="<? echo base_url(); ?>assets/theme/login/theme-admin/css/styles.css">
        <link rel="stylesheet" type="text/css" href="<? echo base_url(); ?>assets/theme/login/theme-admin/css/styles-responsive.css">
        <link rel="stylesheet" type="text/css" href="<? echo base_url(); ?>assets/theme/login/theme-admin/css/login.css">
        
        <script>
            var base_url = '<? echo base_url(); ?>';
        </script>
        
    </head>
    
    <body class="login">
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-offset-4 col-md-4 col-sm-offset-3 col-sm-6 col-xs-offset-1 col-xs-10 content-outer">
                    <div class="logo">
                        <h4 style="color: #f8f8f8">Jedupa</h4>
                    </div>
                    <div class="content animated fadeIn">
                        <? // echo form_open('admin/admin/doLogin', array('class'=>'login-form', 'id'=> 'login-form')); ?>
                        <form class="login-form" id="login-form">
                            <h3 class="form-title">Log into your account</h3>
                            <span class="login-error"><? //echo $error; ?></span>
                            <div class="form-group">
                                <div class="input-icon">
                                    <i class="fa fa-user"></i>
                                    <input class="form-control" name="username" id="email" placeholder="Username" type="text" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-icon">
                                    <i class="fa fa-lock"></i>
                                    <input class="form-control" name="password" id="password" placeholder="Password" type="password" required>
                                </div>
                            </div>
                            <div class="form-action">
                                <div class="form-group">
                                    <button class="btn btn-info btn-block bg-primary login-btn border-primary" id="login-btn" type="button" >Login</button>
                                </div>
                            </div>
                            <div class="forgot-password">
                                <h4 style="display: none">Forgot your password?</h4>
                                <p>Forgot password? Click <a href="#">here</a> to reset your password.</p>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
<!--        <div class="copyright">
            Powered by <a href="mailto:60bitts@gmail.com">PenguinCMS</a>
        </div>-->
        
        <!--Loading overlay-->
        <div class="transparent-overlay" id="loading-overlay">
            <div class="loading-img">
                <img src="<? echo base_url(); ?>assets/images/system-images/loading.gif">
            </div>
        </div>
        
        <!--Informational Toast-->
        <div class="toast-container">
            <div class="toast">
                Successfully Added
            </div>
        </div>
        
        
        <script src="<? echo base_url(); ?>assets/lib/jquery/jquery-2.2.1.min.js"></script> 
        <script src="<? echo base_url(); ?>assets/lib/bootstrap/js/bootstrap.min.js"></script>
        <script src="<? echo base_url(); ?>assets/lib/smoke/js/smoke.min.js"></script>
        <script src="<? echo base_url(); ?>assets/lib/bootstrap/bootstrap-datepicker-1.6.4-dist/js/bootstrap-datepicker.min.js"></script>
        <script src="<? echo base_url(); ?>assets/theme/assets/js/ui.js"></script>
        <script src="<? echo base_url(); ?>assets/theme/login/theme-admin/script/app.js"></script>
        
    </body>
    
</html>
