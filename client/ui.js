$(document).ready(function(){
	$("#register").hide();

	$("#registerButton").click(function(){
		$("#register").toggle();
	});

	$('#registerSave').click(function(){
		$("#register").toggle();
	});
});