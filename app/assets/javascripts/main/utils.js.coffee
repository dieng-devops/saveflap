root = exports ? this

root.setAlertDismiss = ->
  $('.alert:not(.dont-dismiss)').delay(3000).slideUp(200, -> $(this).alert('close'))
