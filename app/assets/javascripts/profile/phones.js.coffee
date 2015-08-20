init = ->

  $('.phone_check').on 'click', ->
    $.ajax
      url: '/phones/send_sms'
      type: "GET"

      beforeSend: ->
        console.log 'inactive link'
      success: (data)->
        console.log data
        console.log 'active link'
      error: ->
        console.log 'Internal error. Please try again.'

  $('.check_phone_send').on 'click', ->
    sms_key = $(this).siblings('input').val()
    phone_id = $(this).data('phone-id')

    $.ajax
      url: '/phones/' + phone_id
      type: "PUT"
      data: { sms_key: sms_key }
      beforeSend: ->
        console.log 'inactive link'
      success: (data)->
        console.log data
        console.log 'active link'
      error: ->
        console.log 'Internal error. Please try again.'

$(document).on('page:change', init)

# ie8 turbolinks fix
unless Turbolinks.supported
  $ init