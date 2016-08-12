$(function(){

  $("form #new_answer").on("submit", function(event){
    event.preventDefault();
    if ($.trim($("#your_answer").val()) == "") {
        alert('You did not write anything in your answer');
    }
    else {
      var answer = $("#your_answer").val();
      var answer_author = $(".answer_author").val();

    }

    $.ajax({
      method:"post",
      dataType:"html",
      url: "/post/:id",
      data: {your_answer: answer}
    }).success(function(response){
      data = JSON.parse(response)
      $("#answer_list").append("<li class='answer'><article><p>" + data.answer + " </p><span class='answer_author'>" + data.author + " </span></article></li>");

      $(".answers section").trigger("reset")
    })


  });
});
