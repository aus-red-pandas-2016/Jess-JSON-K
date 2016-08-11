$(document).ready(function() {

  $(".new-comment-button").on("click",function(){
    $("#comment-form-container").show();
  })

  $("#comment-form-container form").on("submit",function(e){
    e.preventDefault();

    var formData = $(this).serialize();

    $.ajax({
      method:"post",
      dataType:"html",
      url: "/comment/new",
      data: formData
    }).done(function(info){
      $("#comment_group").append(info);

      $("#comment-form-container form").trigger("reset")
      $("#comment-form-container").hide()
    })

  })


});
