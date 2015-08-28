init = ->
  $('.rejected_list_drop_btn').on 'click', ->
    $(this).parents('.rejected_list').toggleClass('dropped')
  $('.rejected_list_drop_btn').on 'clickoutside', ->
    $(this).parents('.rejected_list').removeClass('dropped')

  $('.approve_bike').on 'click', ->
    btn = $(this)
    el = btn.parents('.moderation_bike')
    id = el.data('bike-id')
    $.ajax
      url: '/profile/bikes/moderation/' + id
      type: "PUT"
      data:
        status: 'approved'
      beforeSend: ->
        btn.addClass('loading')
      success: (data)->
        flasher data
        el.remove()
      error: ->
        flasher data
        btn.addClass('loading')

  $('.reject_bike').on 'click', ->
    btn = $(this)
    el = btn.parents('.moderation_bike')
    id = el.data('bike-id')
    $.ajax
      url: '/profile/bikes/moderation/' + id
      type: "PUT"
      data:
        status: 'rejected'
        status_message: btn.text()
      beforeSend: ->
        btn.addClass('loading')
      success: (data)->
        flasher data
        el.remove()
      error: ->
        flasher data
        btn.addClass('loading')

$(document).on('page:change', init)

# ie8 turbolinks fix
unless Turbolinks.supported
  $ init