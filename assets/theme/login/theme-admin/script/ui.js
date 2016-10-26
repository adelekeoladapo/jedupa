$(document).ready(function(){
    /* Sidebar dropdown */
    $('body').on('click', '.menu', function(){
        var id = $(this).attr('id');
        if(id == 1){
            $(this).children('a').children('.arrow').removeClass('open');
            $(this).children('.sub-menu').slideUp(150);
            $(this).attr('id', 0);
        }else{
            $(this).siblings().children('a').removeClass('active');
            $(this).siblings().attr('id', 0);
            $(this).siblings().children('a').children('.arrow').removeClass('open');
            $(this).siblings().children('.sub-menu').slideUp(150);
            $(this).children('a').addClass('active');
            $(this).attr('id', 1);
            $(this).children('a').children('.arrow').addClass('open');
            $(this).children('.sub-menu').slideDown(150);
            $(this).siblings().children('.sub-menu').children('li').find('a').removeClass('active');
        }
    });
    
    $('body').on('click', '.menu .sub-menu li', function(e){
        $(this).siblings().find('a').removeClass('active');
        $(this).find('a').addClass('active');
        e.stopPropagation();
    }); 
    
    $('body').on('click', '.navbar-toggle', function(e){
        $('.main-container .nav-container').toggle(150);
    });
    
    $('body').on('click', '.activity .arrow', function(e){
        var id = $(this).attr('id');
        if(id != 1){
            $(this).parents('.activity').find('.activity-body').slideToggle(150);
            $(this).addClass("open");
            $(this).attr('id', 1);
        }else{
            $(this).parents('.activity').find('.activity-body').slideToggle(150);
            $(this).removeClass("open");
            $(this).attr('id', 0);
        }
        
    });
    
    /*
     * Classes toggle
     */
    $('body').on('click', '.classes ul li a', function(e){
        $(this).parent('li').siblings().find('a').removeClass('active');
        $(this).addClass('active');
    });
    
    /*
     * Subclasses toggle
     */
    $('body').on('click', '.section-title ul li', function(){
        $(this).siblings().removeClass('active');
        $(this).addClass('active');
    });
    
    /** Split Block **/
    $('body').on('click', '.split-block .title-div li', function(){
        var url = $(this).data('url');
        var panes = $('.split-block .content-div>div');
        $(this).siblings().removeClass('active');
        panes.removeClass('active');
        $(this).addClass('active');
        panes.parent().find('#'+url).addClass('active');
    });
    
    /** Dismiss FancyBox **/
    $('body').on('click', '.fancybox .dismiss', function(){
        $('.fancybox').hide();
    });
    
});


function toast(message){
    $('.toast').slideUp(150);
    $('.toast').html(message);
    $('.toast').slideDown(150);
    setTimeout(function(){
        $('.toast').slideUp(150);
    }, 3000);
    
}

function clear_form_fields(form_name){
    var form = document.forms[form_name];
    for(i = 0; i < form.length; i++){
        form[i].value = '';
    }
}

function show_loading_overlay(){
    $('#loading-overlay').css("display", "block");
}

function hide_loading_overlay(){
    $('#loading-overlay').css("display", "none");
}

