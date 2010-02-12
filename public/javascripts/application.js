// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function add_fields(link, association, content) {		
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g")
  $(link).parent().after(content.replace(regexp, new_id));
}

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

$(document).ready(function() {

	if($("#company_country_id").val() != 15) //Id 15 = México
	{
		$("#company_state").hide();
	}
	else 
	{
		$("#company_state").show();
	}	

	$("#company_country_id").change(function () {
		$("#company_country_id option:selected").each(function () {
			if($(this).text() == "México")
			{
				$("#company_state").show();
			}
			else
			{				
				$("#company_state_id").val("");
				$("#company_state").hide();		
			}
    });
  })
  
  $("#advanced_link a").click(function() {
  	$("#advanced_search").toggle('blind',{},'slow');
  } );
  
  $("select.dropdownsearch").selectmenu({maxHeight: 350, width: 300, style:'dropdown'});
  
  $(".signin").click(function(e) {
  	e.preventDefault();
    $("fieldset#signin_menu").toggle();
    $(".signin").toggleClass("menu-open");
  });

  $("fieldset#signin_menu").mouseup(function() {
  	return false
  });
  
  $(document).mouseup(function(e) {
  	if($(e.target).parent("a.signin").length==0) {
  	  $(".signin").removeClass("menu-open");
      $("fieldset#signin_menu").hide();
    }
	});
	
	$(".tiptip").hover(function () {
		$(".tiptip").tipTip({maxWidth: "auto", position:"top", edgeOffset:10});
	});
	
	$("#new_password_form").dialog({autoOpen:false, modal:true, dialogClass: 'password_form', minWidth: 400, minHeight: 300 });
	$("#reset_password_form").dialog({autoOpen:false, modal:true, dialogClass: 'password_form', minWidth: 400, minHeight: 300});
	
	
	$("#new_password a").click(function() {
		$("#new_password_form").dialog('open');
	});
	
	$("#new_password.cancel").click(function() {
		$("#new_password_form").dialog('close');
	});
	
	$("a#reset_password").click(function() {
		$("#reset_password_form").dialog('open');
	});
	
	$("#reset_password.cancel").click(function() {
		$("#reset_password_form").dialog('close');
	});
	
	$(".contact_submit").formValidator( {
		errorDiv: '#errorDiv2',
		customErrMsg: 'Todos los campos son requeridos',
		scope: "#contact_form"
	});


	
});
