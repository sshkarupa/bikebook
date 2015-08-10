#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .

$ ->
  setTimeout(->
    $('.flash').fadeOut()
  ,4000)
