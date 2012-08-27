# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

node = $('#train_category')

jQuery ->
  node.change ->
    type = node.value()
    if(type is '在岗培训')
        node.parent().append("<select id='injob_type'><option value='test'></option></select>")
