# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

register_link = (target) ->
  name = target.href.match(/\/(\w+)$/)[1]
  $.get target.href, (data) ->
    $("##{name} .result").html data
  false

jQuery -> 
  $('a.render').click (event) ->
    register_link event.target