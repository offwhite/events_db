var ready = function(){
  // TODO: really nead to rebuild this in react
  prep_lookup('input.profile_lookup', profile_lookup);
  prep_lookup('input.role_type_lookup', role_type_lookup);
  prep_lookup('input.venue_lookup', venue_lookup);
  prep_lookup('input.town_lookup', town_lookup);
  prep_shortcuts();

  $('body').on('click', '.profile_lookup_list li', set_profile);
  $('body').on('click', '.role_type_lookup_list li', set_selected_role_type);
  $('body').on('click', '.venue_lookup_list li', set_selected_venue);
  $('body').on('click', '.event_lookup_list li', set_selected_event);
  $('body').on('click', '.town_lookup_list li', set_selected_town);
  $('body').on('click', '.event_lookup', event_lookup);
  $('.date_input').on('change', event_lookup);

  $('.event_name, .event_type_id, .venue_address').on('change', show_next_step);

  $('.submit-row, .event_panel, .role_type_panel').hide();
  $('.content input[type=text]:not(.disable-auto-select), .content input[type=date], .content textarea').first().focus();
};

function prep_lookup(input, callback){
  $(input).on('keyup keypress', callback);
  $(input).focus(callback);
  $(input).blur(show_next_step);
}

// --- utilities ---

function prep_shortcuts(){
  $('.content input').on('keyup keypress', function(e) {
    var keyCode = e.keyCode || e.which;
    if (keyCode === 13 && !$(this).hasClass('allow-enter')) {
      e.preventDefault();
      return false;
    }
  });
}

// --- profile ---

function profile_lookup(){
  $('input.profile_lookup_id').val('')
  show_next_step();
  var string = $(this).val();
  var only_unclaimed = $(this).hasClass('only_unclaimed');
  if(string.length < 3){return}

  $.ajax({
    url     : '/profile-lookup',
    type    : 'POST',
    context : document.body,
    data    : {search: string, only_unclaimed: only_unclaimed}
  });
};

function set_profile(){
  var id = $(this).data('id')
  var name = $(this).find('.lookup-name').html()

  if($(this).data('id') != undefined){
    $('input.profile_lookup_id').val(id)
    $('input.profile_lookup').val(name)
  }

  $('.profile_lookup_list ').slideUp();
  $('input.role_type_lookup').focus();
}

// -- role type ---

function role_type_lookup(){
  $('input.role_type_lookup_id').val('')
  show_next_step();
  var string = $(this).val();
  if(string.length < 3){return}

  $.ajax({
    url     : '/role-type-lookup',
    type    : 'POST',
    context : document.body,
    data    : {search: string}
  });
};

function set_selected_role_type(){
  var id = $(this).data('id')
  var name = $(this).find('.lookup-name').html()
  $('input.role_type_lookup_id').val(id)
  $('.role_type_lookup').val(name)

  $('.role_type_lookup_list ').slideUp();
  show_next_step()
}

// --- venue ---

function venue_lookup(){
  $('input.venue_lookup_id').val('')
  show_next_step();
  var string = $(this).val().replace('the ', '');
  if(string.length < 3){return}

  $.ajax({
    url     : '/venue-lookup',
    type    : 'POST',
    context : document.body,
    data    : {search: string}
  });
};

function set_selected_venue(){
  var id = $(this).data('id')
  var name = $(this).find('.lookup-name').html()

  if(id == 'new'){
    show_new_venue_form();
    return
  }

  $('input.venue_lookup_id').val(id)
  $('.venue_lookup').val(name)

  $('.venue_lookup_list').slideUp();
  $(".venue_address input, .venue_address textarea").attr('required', false);
  $(".venue_address").slideUp();
  show_next_step();
  event_lookup();
}

function show_new_venue_form(){
  $(".venue_address").attr('required', true).slideDown();
  $(".venue_address input, .venue_address textarea").attr('required', true);
  $('.venue_lookup_list').slideUp();
}

// --- Event ---

function date_as_string(){
  return $('#role_event_attributes_date_1i').val() + '-' + $('#role_event_attributes_date_2i').val() + '-' + $('#role_event_attributes_date_3i').val();
}

function event_lookup(){
  $('input.event_lookup_id').val('')
  $('.event_lookup_list_holder').html('')
  $('.existing-events, .new-events').slideDown();
  var venue_id = $('input.venue_lookup_id').val();
  var date = date_as_string();
  show_next_step();

  $.ajax({
    url     : '/event-lookup',
    type    : 'POST',
    context : document.body,
    data    : {venue_id: venue_id, date: date}
  });
};

function set_selected_event(){
  var id = $(this).data('id')
  var name = $(this).find('.lookup-name').html()
  $('input.event_lookup_id').val(id)
  $('.event_lookup').html('Selected: '+name)

  $('.existing-events, .new-events').slideUp();
  show_next_step();
}

// --- town ---

function town_lookup(){
  $('input.town_lookup_id').val('');
  $('input[type=submit]').slideUp();
  var string = $(this).val();
  if(string.length < 3){return}

  $.ajax({
    url     : '/town-lookup',
    type    : 'POST',
    context : document.body,
    data    : {search: string}
  });
};

function set_selected_town(){
  var id = $(this).data('id')
  var name = $(this).find('.lookup-name').html()
  $('input.town_lookup_id').val(id);
  $('input[type=submit]').slideDown();
  $('.town_lookup').val(name)

  $('.town_lookup_list').slideUp();
  show_next_step();
}

// --- SAVE BTN ---

function venue_set(){
  if($('input.venue_lookup_id').val() !== ''){
    return true;
  }
  if(
    $('textarea.venue_address').val().length > 5 &&
    $('input.town_lookup_id').val() !== ''
  ){
    return true
  }
  return false
}

function show_next_step(){
  if($('.add-role-to-profile').length > 0){

    if(venue_set()){
      $('.event_panel').slideDown();
    }else{
      $('.event_panel').slideUp();
      $('.role_type_panel').slideUp();
      $('.submit-row').slideUp();
      return
    }

    // is event set?
    if(
      $('.event_lookup_id').val() !== '' ||
      (
        $('.event_name').val().length > 3 &&
        $('.event_type_id').val() !== ''
      )
    ){
      $('.role_type_panel').slideDown();
    }else{
      $('.role_type_panel').slideUp();
      $('.submit-row').slideUp();
      return
    }

    // is the role type set?
    if(
      $('input.role_type_lookup_id').val() == ''
    ){
      $('.submit-row').slideUp();
      return
    }
  }
  if($('.add-role-to-event').length > 0){
    if(
      $('input.role_type_lookup_id').val() == '' ||
      $('input.profile_lookup').val().length < 3
    ){
      $('.submit-row').slideUp();
      return
    }
  }

  $('.submit-row').slideDown();
}





$(document).on('turbolinks:load', ready);
