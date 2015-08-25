init = ->

  $('#bike_price').mask('000 000 000 000 000', {reverse: true})

  $('.city select').styler
    selectSearch: true

  # remove picture checker
  if $('.edit_fields .fields').length <= 1
    $('.edit_fields').find('.btn_danger').hide()

  $('.edit_fields .fields .btn_danger').on 'click', ->
    if $('.edit_fields .fields:visible').length <= 2
      $('.edit_fields').find('.btn_danger').hide()

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

  $(document).on 'nested:fieldAdded', ->
    $('input, select').styler() # 'couse can't fired trigger('refresh')

$(document).on('page:change', init)

# ie8 turbolinks fix
unless Turbolinks.supported
  $ init