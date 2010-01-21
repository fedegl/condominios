// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {

	$("#company_state").hide();

	$("#company_country_id").change(function () {
		$("#company_country_id option:selected").each(function () {
			if($(this).text() == "México"){
				$("#company_state").show();
			}
			else{
				$("#company_state").hide();
			}
    });
  })
  
  $("select#location").selectmenu({maxHeight: 350, width: 300, style:'dropdown'});
  
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
  
});
