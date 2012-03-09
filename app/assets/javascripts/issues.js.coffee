# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ (e) ->

  $("#toggle_list").click (e) ->
    $("#issues #paged").toggle()
    $("#issues #unpaged").toggle()

  $("#selected_version").change (e) ->
    version = $(this).val()
    project = $("#selected_project").val()
    window.location = window.location.pathname + "?selected_project=" + project + "&selected_version=" + version

  $("#selected_project").change (e) ->
    project = $(this).val()
    version = $("#selected_version").val()
    window.location = window.location.pathname + "?selected_project=" + project
