var ready = function(){
  prep_profile_lookup();
  prep_role_type_lookup();

  $('.submit-row').hide();
  $('.page-content input[type=text], .page-content input[type=date], .page-content textarea').first().focus();
};

function prep_profile_lookup(){
  $('input.profile_lookup').keyup(profile_lookup);
  $('input.profile_lookup').focus(profile_lookup);
  $('.profile_lookup').blur(show_save_button);
  $('body').on('click', '.profile_lookup_list li', set_selected_profile);
}

function set_selected_profile(){
  var id = $(this).data('id')
  var name = $(this).find('.profile-name').html()
  $('input.profile_lookup_id').val(id)
  $('input.profile_lookup').val(name)

  $('.profile_lookup_list ').slideUp();
  $('input.role_type_lookup').focus();
}

function profile_lookup(){
  $('input.profile_lookup_id').val('')
  show_save_button();
  var string = $(this).val();
  if(string.length < 3){return}

  $.ajax({
    url     : '/profile-lookup',
    type    : 'POST',
    context : document.body,
    data    : {search: string}
  });
};

function prep_role_type_lookup(){
  $('input.role_type_lookup').keyup(role_type_lookup);
  $('input.role_type_lookup').focus(role_type_lookup);

  $('body').on('click', '.role_type_lookup_list li', set_selected_role_type);
}

function set_selected_role_type(){
  var id = $(this).data('id')
  var name = $(this).find('.role-type-name').html()
  $('input.role_type_lookup_id').val(id)
  $('.role_type_lookup').val(name)

  $('.role_type_lookup_list ').slideUp();
  show_save_button()
}

function role_type_lookup(){
  $('input.role_type_lookup_id').val('')
  show_save_button();
  var string = $(this).val();
  if(string.length < 3){return}

  $.ajax({
    url     : '/role-type-lookup',
    type    : 'POST',
    context : document.body,
    data    : {search: string}
  });
};

function show_save_button(){
  if(
    $('input.role_type_lookup_id').val() == '' ||
    $('input.profile_lookup').val().length < 3
  ){
    $('.submit-row').slideUp();
    return
  }
  console.log($('input.profile_lookup').val().length)
  $('.submit-row').slideDown();
}





$(document).on('turbolinks:load', ready);
