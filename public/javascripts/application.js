// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


jQuery(document).ready(function() {
    jQuery('a[rel*=facebox]').facebox(); 
    jQuery(".preview").click(function() {  
        var name = $("input#victim_url_name").val();  
        var url = $("input#victim_url_url").val();  
        var query = $("input#victim_url_query").val();  
        var dataString = 'victim_url[name]='+ name + '&victim_url[url]=' + encodeURIComponent(url) + '&victim_url[query]=' + query; 
        jQuery.facebox(function($) { 
            jQuery.get('/victim_urls/preview', dataString, function(data) { jQuery.facebox(data) })
        })
    });  
});





