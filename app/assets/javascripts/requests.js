$(document).ready(function() {
  $.ajax({
    url: '/friendships/requests',
    type: 'GET',
    success: function(responseData) {
      for(var i = 0, len = responseData.length; i < len; i++) {
        $('.requests').append(responseData[i].status); 
      }
    }
  });
})