init = ->
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