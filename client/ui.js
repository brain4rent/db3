$(document).ready(function(){
  $("#registerForm").hide();

  $("#registerNow").click(function(){
    $("#registerForm").show();
    $("#registerNow").hide();
  });
  $("#register").click(function(){
    $("#registerForm").hide();
    $("#registerNow").show();
  });
  $("#cancel").click(function(){
    $("#registerForm").hide();
    $("#registerNow").show();
  });
});