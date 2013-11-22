# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('.button_to').on 'ajax:success', (e, resp) ->
    console.log resp
    $(".votes-count[data-id=#{resp.id}]").text(resp.votes)


$(ready)
$(document).on 'page:load', ready