# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

registerLink = (target) ->
  name = target.href.match(/\/(\w+)$/)[1]
  $.get target.href, (data) ->
    $("##{name} .result").html data
    $("##{name} .result").slideToggle()
  false

toggleTemplate = (target) ->
  name = target.href.match(/\/(\w+)$/)[1]
  $("##{name} .source").slideToggle()
  $(target).siblings('a.render').toggle()
  false

lastTrySource = '';

evalJsonify = (target) ->
  lastTrySource = $.trim $('#try_source').val()
  $.post "/try/eval_jsonify", {try_source: lastTrySource}, (data) ->
    $('#try_result').html data

trySource = (target) ->
  evalJsonify(event.target) if $.trim( $('#try_source').val() ) != lastTrySource
  

jQuery ->
  $("pre.language-ruby").snippet "ruby",
    style: "neon"
    showNum: false
    menu: false
  $("pre.language-javascript").snippet "javascript",
    style: 'desert'
    showNum: false
    menu: false
  $('a.template').click (event) ->
    toggleTemplate event.target
  $('a.render').click (event) ->
    registerLink event.target
  $('textarea#try_source')
    .focus()
    .keyup (event) ->
      trySource(event.target)