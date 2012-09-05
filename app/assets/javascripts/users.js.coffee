jQuery ->
  options = $.extend {"aaSorting": [[1, "asc"]]}, dt_options
  $('#users').dataTable(options)
