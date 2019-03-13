var ready = function(){
  prepConfirmations();
};

var prepConfirmations = function(){
  $('.confirm').click(function(e){
    var title = $(this).attr('title');
    if (!confirm(title + ' - Are you sure?')){
      e.preventDefault();
      return false;
    }
  });
}

$(document).on('turbolinks:load', ready);
