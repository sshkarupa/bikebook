window.flasher =(data)->
  message_type = 'notify'
  message_text = 'Внутренняя ошибка'
  if data.status == 400
    message_type = 'alert'
    message_text = data.responseJSON.message.alert
  else
    if data.message.hasOwnProperty('success')
      message_type = 'success'
      message_text = data.message.success
    else
      message_type = 'notify'
      message_text = data.message.notify

  $('body').append(
    "<div class='flash'>" +
      "<div class='message #{message_type}'>"+message_text+"</div>" +
    "</div>"
  )

  setTimeout(->
    $('.flash').fadeOut()
  , 3000)

init = ->
  setTimeout(->
    $('.flash').fadeOut()
  , 3000)
$(document).on('page:change', init)

# ie8 turbolinks fix
unless Turbolinks.supported
  $ init
