init = ->

  $('input, select').styler()

  $('#user_phone_attributes_number').mask '8 (000) 000-00-00',
    placeholder: "8 (000) 000-00-00"

$(document).on('page:change', init)

# ie8 turbolinks fix
unless Turbolinks.supported
  $ init