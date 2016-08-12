$(document).ready(function() {

  $(".new-post-comment-button").on("click",function(){
    $(".new-post-comment-button").hide();
    $(".container-comment-form.Post").show();
  })

  $(".new-answer-comment-button").on("click",function(){
    $(".new-post-answer-button").hide();
    $(".container-comment-form.Answer").show();
  })

  $(".container-comment-form form").on("submit",function(e){
    e.preventDefault();

    var formData = $(this).serialize();

    $.ajax({
      method:"post",
      dataType:"html",
      url: "/comment/new",
      data: formData
    }).done(function(info){
      debugger;

      $("#comment_group").append(info);

      $(".container.comment-form form").trigger("reset")
      $(".container.comment-form").hide()
    })

  })


});
