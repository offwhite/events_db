var ready = function(){
  prepConfirmations();
  prepMobileMenus();
  prepCollapsibles();
  prepMyProfile();
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

var prepCollapsibles = function() {
  $('.collapsible .panel-head').click(function(){
    $(this).parent().find('.panel-body').slideToggle();
  });
}

var prepMyProfile = function() {
  $('.my-profile').click(function(e){
    id = $(this).data('id');
    name = $(this).data('name');
    $('.profile_lookup_id').val(id);
    $('.profile_lookup').val(name);
    e.preventDefault();
    return false;
  });
};

$(document).on('turbolinks:load', ready);
