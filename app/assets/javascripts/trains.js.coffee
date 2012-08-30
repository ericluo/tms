# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  node = $('#train_category')
  catalog_node =
  node.change ->
    type = node.val()
    if(type is '在岗培训')
      # request ajax call
      $.ajax({
        type: 'get',
        url: "/in_job_train_catalogs.json"
        success: select_populate})
    else
      $('#in_job_train_catalog').remove()

select_populate = (data) ->
  select_html = "<select id='in_job_train_catalog' name='train[in_job_train_catalog_id]' class='select optional'>"
  for d in data
    select_html += "<option value='#{d.id}'>#{d.title} -- #{d.level}</option>"
  select_html += "</select>"
  $('#train_category').parent().append(select_html)
