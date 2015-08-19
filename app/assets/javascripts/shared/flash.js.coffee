init = ->
  setTimeout(->
    $('.flash').fadeOut()
  , 3000)

$(document).on('page:change', init)

# ie8 turbolinks fix
unless Turbolinks.supported
  $ init

