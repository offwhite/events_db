var ready = function(){
  profile_lookup();
};

function profile_lookup(){
  $('input.profile_lookup').keyup(lookup);
  $('input.profile_lookup').focus(lookup);

  $('body').on('click', '.profile_lookup_list li', function(e) {
    var id = $(this).data('id')
    var name = $(this).find('.profile-name').html()
    $('input.profile_lookup_id').val(id)
    $('input.profile_lookup').val(name)

    $('.profile_lookup_list ').slideUp();
  });
}

function lookup(){
  $('input.profile_lookup_id').val('')
  var string = $(this).val();
  if(string.length < 3){return}

  $.ajax({
    url     : '/profile-lookup',
    type    : 'POST',
    context : document.body,
    data    : {search: string}
  });
};





$(document).on('turbolinks:load', ready);
