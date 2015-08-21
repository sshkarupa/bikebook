init = ->

  resend_sms_timer = (link) ->
    i = 30
    link.find('.timer').text(i)
    timerId = setInterval(->
      if i == 1
        clearInterval timerId
        link.removeClass('done')
        link.find('.timer').text('')
      else
        i--
        link.find('.timer').text(i)
    ,1000)


  $('body').on 'click', '.send_sms:not(.done)', ->
    $this = $(this)
    $this.addClass('done')
    $this.siblings('.phone_check_form').show()
    $.ajax
      url: '/phones/send_sms'
      type: "GET"
      beforeSend: ->
        resend_sms_timer $this
        console.log 'inactive link'
      success: (data)->
        console.log data

      error: ->
        console.log 'Internal error. Please try again.'

  $('.check_phone_send').on 'click', ->
    sms_key = $(this).siblings('input').val()
    phone_id = $(this).data('phone-id')
    fg = $(this).parents('.form_group')
    $this = $(this)
    $.ajax
      url: '/phones/' + phone_id
      type: "PUT"
      data: { sms_key: sms_key }
      beforeSend: ->
        $this.addClass('sending')
      success: (data)->
        if data.success
          fg.toggleClass('inactivated activated')
          fg.find('.phone_check_form').hide()
        else
          alert data.error
          $this.removeClass('sending')
      error: ->
        alert "Произошла ошибка"

$(document).on('page:change', init)

# ie8 turbolinks fix
unless Turbolinks.supported
  $ init