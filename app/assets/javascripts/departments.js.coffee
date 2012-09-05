# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# jQuery ->
#   $('#departments').dataTable( {
#     "bRetrieve": true
#     "aaSorting": [[1, "asc"]]
#   })
jQuery ->
  $('#departments').dataTable(window.dt_options)

console.log window.dt_options
