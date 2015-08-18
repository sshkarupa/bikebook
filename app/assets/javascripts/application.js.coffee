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

  $('.bike_slider').magnificPopup
    delegate: 'a'
    type: 'image'
    tLoading: 'Loading image #%curr%...'
    mainClass: 'mfp-img-mobile'
    gallery:
      enabled: true
      navigateByImgClick: true
      preload: [0, 1]

  $(".bike_slider").owlCarousel
    items: 1
    nav: true
    navText: ["",""]
    loop: false

  setTimeout(->
    $('.flash').fadeOut()
  ,4000)

  $('.form_group.department select').styler
    selectSearch: true
    onSelectClosed: ->
      $city = $('.form_group.city select')
      city = $('select').val()
      $.ajax
        url: '/cities/' + city
        type: "GET"
        success: (data)->
          $city.find("option").each -> $(this).remove()
          for val in data.cities
            $city.append($("<option></option>").attr("value", val.id).text(val.name))
        complete: ->
          $city.attr('disabled', false).trigger('refresh')
        error: ->
          alert('Internal error. Please try again.')

  $('.show_phone').on 'click', ->
    el = $(this)
    id = el.data('phone')
    $.ajax
      url: '/bikes/' + id
      type: "GET"
      dataType: 'json'
      beforeSend: ->
        el.addClass('loading')
      success: (data)->
        parent = el.siblings('span')
        el.remove()
        parent.after(data.phone)
        el.removeClass('loading')
      error: ->
        el.removeClass('loading')
        alert('Internal error. Please try again.')

  $('.show_email').on 'click', ->
    el = $(this)
    id = el.data('email')
    $.ajax
      url: '/bikes/' + id
      type: "GET"
      dataType: 'json'
      beforeSend: ->
        el.addClass('loading')
      success: (data)->
        parent = el.siblings('span')
        el.remove()
        parent.after(data.email)
        el.removeClass('loading')
      error: ->
        el.removeClass('loading')
        alert('Internal error. Please try again.')


  $('input, select').styler
    selectSearch: true
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

