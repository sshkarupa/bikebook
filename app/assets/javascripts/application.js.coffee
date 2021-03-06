#= require jquery
#= require jquery_ujs
#= require jquery_nested_form
#= require turbolinks
#= require vendor/jquery.mask
#= require vendor/nprogress
#= require vendor/jquery.formstyler
#= require vendor/minigrid
#= require vendor/jquery.ba-outside-events
#= require shared/flash
#= require shared/header
#= require bikes/bike
#= require profile/bikes/new
#= require profile/phones
#= require pages/home
#= require lib/forms
#= require_tree .

init = ->

  $(document).on 'page:fetch', ->
    NProgress.start()
    return
  $(document).on 'page:change', ->
    NProgress.done()
    return
  $(document).on 'page:restore', ->
    NProgress.remove()
    return


$(document).on('page:change', init)

# ie8 turbolinks fix
unless Turbolinks.supported
  $ init