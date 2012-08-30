# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('.datatable').dataTable
    sDom: "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
    sPaginationType: "bootstrap"
    oLanguage:
      sLengthMenu: "每页 _MENU_ 条"
      sSearch: "模糊查询:"
      sInfo: "第 _START_ ~ _END_ 条，共 _TOTAL_ 条 "
      oPaginate:
        sPrevious: "上一页"
        sNext:     "下一页"
