jQuery ->
  options = $.extend {"aaSorting": [[1, "asc"]]}, dt_options
  $('#positions').dataTable(options)
