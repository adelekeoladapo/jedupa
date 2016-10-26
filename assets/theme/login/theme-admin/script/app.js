$(document).ready(function(){
    
    /*
     * Login
     */
    $('#login-btn').click(function(){
        
        if($('#login-form').smkValidate()){
            show_loading_overlay();
            var form_data = $('#login-form').serialize();
            $.ajax({
                type: "POST",
                url: BASE_URL+"admin/doLogin",
                data: form_data,
                success:function(result, status, xhr){
                    if(result){
                        window.location = BASE_URL+"admin";
                    }else{
                       hide_loading_overlay();
                       toast("Invalid username and/or password"); 
                    }
                },
                complete: function(){

                },
                timeout: 50000,
                error: function(){
                    hide_loading_overlay();
                    toast("An error occurred. Try again");
                }
            });
        }
        
    });
    
});







