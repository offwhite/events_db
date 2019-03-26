var ready = function(){
  prepConfirmations();
  prepMobileMenus();
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

var prepMobileMenus = function(){
  $('.admin-burger').click(function(){
    $(this).toggleClass('open')
    $('.admin-links').slideToggle();
  });
}

$(document).on('turbolinks:load', ready);
