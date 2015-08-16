#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require vendor/jquery.mask
#= require vendor/nprogress
#= require vendor/jquery.formstyler
#= require vendor/minigrid
#= require jquery_nested_form
#= require_tree .

init = ->

  if $('.edit_fields .fields').length <= 1
    $('.edit_fields').find('.btn_danger').hide()

  $('.edit_fields .fields .btn_danger').on 'click', ->
    if $('.edit_fields .fields:visible').length <= 2
      $('.edit_fields').find('.btn_danger').hide()


  $(".bike_slider").owlCarousel
    items: 1
    nav: true
    navText: ["",""]
    loop: false

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

  minigrid '.bikes', '.home_bike', 10

  window.addEventListener 'resize', ->
    minigrid '.bikes', '.home_bike', 10

$(document).on('page:change', init)

# ie8 turbolinks fix
unless Turbolinks.supported
  $ init

