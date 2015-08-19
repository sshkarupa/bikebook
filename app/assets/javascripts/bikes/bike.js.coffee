init = ->

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


$(document).on('page:change', init)

# ie8 turbolinks fix
unless Turbolinks.supported
  $ init

