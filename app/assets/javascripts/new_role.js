var ready = function(){
  prep_profile_lookup();
  prep_role_type_lookup();

  $('.submit-row').hide();
  $('.focus_onload').first().focus();
};

function prep_profile_lookup(){
  $('.profile_lookup').keyup(profile_lookup);
  $('.profile_lookup').focus(profile_lookup);
  $('.profile_lookup').blur(profile_name_blur);
  $('body').on('click', '.profile_lookup_list li', set_selected_profile);
}

function set_selected_profile(){
  var id = $(this).data('id')
  var name = $(this).find('.profile-name').html()
  $('input.profile_lookup_id').val(id)
  $('.profile_lookup').html(name)

  $('.profile_lookup_list ').slideUp();
}

function profile_name_blur(){
  $('input.profile_name').val($(this).html());
  show_save_button();
}

function profile_lookup(){
  $('input.profile_lookup_id').val('')
  show_save_button();
  var string = $(this).html();
  if(string.length < 3){return}

  $.ajax({
    url     : '/profile-lookup',
    type    : 'POST',
    context : document.body,
    data    : {search: string}
  });
};

function prep_role_type_lookup(){
  $('.role_type_lookup').keyup(role_type_lookup);
  $('.role_type_lookup').focus(role_type_lookup);

  $('body').on('click', '.role_type_lookup_list li', set_selected_role_type);
}

function set_selected_role_type(){
  var id = $(this).data('id')
  var name = $(this).find('.role-type-name').html()
  $('input.role_type_lookup_id').val(id)
  $('.role_type_lookup').html(name)

  $('.role_type_lookup_list ').slideUp();
  show_save_button()
}

function role_type_lookup(){
  $('input.role_type_lookup_id').val('')
  show_save_button();
  var string = $(this).html();
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
    $('input.profile_name').val().length < 3
  ){
    $('.submit-row').slideUp();
    return
  }
  console.log($('input.profile_name').val().length)
  $('.submit-row').slideDown();
}





$(document).on('turbolinks:load', ready);
