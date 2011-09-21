# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class_selector = ->
  if document.getElementById("showcase")
    showcase = document.getElementById("showcase")


window.onload = ->
  class_selector()


