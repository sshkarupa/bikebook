init = ->
  $('.mobile_nav_trigger').on 'click', ->
    $(this).siblings('.nav').toggle()

$(document).on('page:change', init)

# ie8 turbolinks fix
unless Turbolinks.supported
  $ init

