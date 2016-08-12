$(document).ready(function() {

  $(".new-comment-button").on("click",function(){
    $(this).next()
    $(this).next(".container.comment-form").show();
  })

  $(".container.comment-form form").on("submit",function(e){
    e.preventDefault();

    var formData = $(this).serialize();

    $.ajax({
      method:"post",
      dataType:"html",
      url: "/comment/new",
      data: formData
    }).done(function(info){
      $("#comment_group").append(info);

      $(".container.comment-form form").trigger("reset")
      $(".container.comment-form").hide()
    })

  })


});
