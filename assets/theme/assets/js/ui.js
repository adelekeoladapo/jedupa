$(document).ready(function(){
    
    /*
     * Side Nav Collapse
     */
    $('body').on('click', '#nav-toggler', function(){
        var nav_toggler = $('.navbar-header.aside.bg-black');
        var sidebar = $('.hidden-xs.bg-black.dk.aside.hidden-print');
        if(nav_toggler.data("status") == "open"){
            nav_toggler.addClass('nav-xs');
            sidebar.addClass('nav-xs');
            nav_toggler.data("status", "close");
        }else{
            nav_toggler.removeClass('nav-xs');
            sidebar.removeClass('nav-xs');
            nav_toggler.data("status", "open");
        }
        
    });
    
    
    /*
     * Node/Unnode nav items onFocus
     */
    $('body').on('mouseover', 'ul#menu-main li', function(){
        $(this).siblings().removeClass('sfhover');
        $(this).addClass('sfhover');
    });
    
    
    /*
     * Node/Unnode nav items onClick
     */
    $('body').on('click', 'ul#menu-main li', function(){
        if($(this).data('status') === "close"){
            $(this).siblings().children('ul').css("display", "none");
            $(this).siblings().data("status", "close");
            $(this).siblings().find('a span i.text').removeClass('fa-angle-left fa-angle-down').addClass('fa-angle-left');
            $(this).children('ul').css("display", "block");
            $(this).find('a span i.text').removeClass('fa-angle-left').addClass('fa-angle-down');
            $(this).data('status', 'open');
        }else{
            $(this).children('ul').css("display", "none");
            $(this).find('a span i.text').removeClass('fa-angle-down').addClass('fa-angle-left');
            $(this).data('status', 'close');
        }
    });
    
    
    /*
     * Upper naviation menu colapse
     */
    $('body').on('click', 'ul.menu > li > a', function(){
        if($(this).parent('li').data('status') === 'close'){
            $(this).parent('li').siblings().children('ul.nav.sub-menu').css('display', 'none');
            $(this).parent('li').siblings().removeClass('active');
            $(this).parent('li').siblings().data('status', 'close');
//            $(this).children('ul.nav.sub-menu').css('display', 'block');
            $(this).siblings('ul.nav.sub-menu').toggle(200);
            $(this).parent('li').addClass('active');
            $(this).parent('li').data('status', 'open');
        }else{
            $(this).siblings('ul.nav.sub-menu').css('display', 'none');
            $(this).parent('li').removeClass('active');
            $(this).parent('li').data('status', 'close');
        }
    });
    
    
    
    /** jd Tab Layout script **/
    
    $('body').on('click', '.jd-tab-container .jd-tab-title-block > ul > li > a', function(){
        var href = $(this).parent('li').data('href');
        var panes = $(this).parents('.jd-tab-container').find('.jd-tab-content-block > div');
        panes.removeClass('active');
        panes.parent().find('#'+href).addClass('active');
        $(this).parent().addClass('active').siblings().removeClass('active');
    });
    
    /** End jd Tab Layout script **/
    
    
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


/** jD Card Layout Script **/
    
function showCard(id){
    var container = $('.jd-cards-container');
    container.children('.jd-card').removeClass('active');
    container.find('.jd-card#'+id).addClass('active');
}

/** End jD Card Layout Script **/
