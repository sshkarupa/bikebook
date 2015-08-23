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


  $('body').on 'click', '.send_sms_btn:not(.done)', ->
    $this = $(this)
    $this.addClass('done')
    $this.siblings('.check_sms_form').show()
    $.ajax
      url: '/phones/send_sms'
      type: "GET"
      beforeSend: -> resend_sms_timer $this
      success: (data)-> flasher data
      error: (data)-> flasher data


  $('.check_sms_btn').on 'click', ->
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
      success: (data) ->
        fg.toggleClass('inactivated activated')
        fg.find('.check_sms_form').hide()
        $this.removeClass('sending')
        flasher data
      error: (data) ->
        flasher data
        $this.removeClass('sending')

$(document).on('page:change', init)

# ie8 turbolinks fix
unless Turbolinks.supported
  $ init