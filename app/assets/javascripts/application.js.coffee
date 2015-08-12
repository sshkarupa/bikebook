#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require vendor/jquery.mask
#= require vendor/nprogress
#= require vendor/jquery.formstyler
#= require jquery_nested_form
#= require_tree .
init = ->
  setTimeout(->
    $('.flash').fadeOut()
  ,4000)

  $('input, select').styler()
  $(document).on 'nested:fieldAdded', ->
    $('input, select').styler() # 'couse can't fired trigger('refresh')


  $('#user_phone').mask '+0 (000) 000-00-00',
    placeholder: "+7 (000) 000-00-00"

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

