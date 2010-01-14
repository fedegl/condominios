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
  
});
