$(document).ready(function() {
  $(".navbar-form").on("keyup", function (data) {
  
    var text = $('.form-control')[0].value;
    $.ajax({
      url: '/users/search',
      type: 'GET',
      data: {text: text},
      success: function(responseData) {
        $('.names').empty();      
      
        for(var i = 0, len = responseData.length; i < len; i++) {
          $('.names').append("<span class=userresult>" + responseData[i].name + "</span><button class='btn btn-success btn-xs adduser' type='button' id=" + responseData[i].id + " ><span class='glyphicon glyphicon-plus'></span></button><br>");
        }
      
        $('.adduser').on("click", function (event) {
          event.preventDefault();
          var userId = Number(event.currentTarget.getAttribute("id"))
          var prompt = confirm("Send friend request?")
          if (prompt) {
            $.ajax({
              url: '/friendships/new',
              type: 'GET',
              data: {id: userId},
              success: function(responseData) {
                console.log(responseData)
              }
            });
          }
        });
      
      }
    
    });
  });
});


