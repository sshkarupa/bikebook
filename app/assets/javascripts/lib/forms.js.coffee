init = ->

  $('input, select').styler()

  $('#user_phone').mask '+0 (000) 000-00-00',
    placeholder: "+7 (000) 000-00-00"

$(document).on('page:change', init)

# ie8 turbolinks fix
unless Turbolinks.supported
  $ init