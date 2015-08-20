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

  owl = $(".bike_slider")
  slides = if owl.find('a').length <= 1 then false else true
  owl.owlCarousel
    items: 1
    nav: slides
    dots: slides
    navText: ["",""]
    loop: false

  $('.show_phone').on 'click', ->
    el = $(this)
    id = el.data('phone')
    console.log id
    $.ajax
      url: '/phones/' + id
      type: "GET"
      dataType: 'json'
      beforeSend: ->
        el.addClass('loading')
      success: (data)->
        parent = el.siblings('span')
        el.remove()
        parent.after(
          data.number.replace /(\d)(\d\d\d)(\d\d\d)(\d\d)(\d\d)/, '$1 ($2) $3-$4-$5'
        )
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

