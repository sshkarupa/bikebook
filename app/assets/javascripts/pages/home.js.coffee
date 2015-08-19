init = ->
  minigrid '.bikes', '.home_bike', 10

  window.addEventListener 'resize', ->
    minigrid '.bikes', '.home_bike', 10

$(document).on('page:change', init)

# ie8 turbolinks fix
unless Turbolinks.supported
  $ init
