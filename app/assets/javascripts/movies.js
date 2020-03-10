$(document).on('ajax:error', function (event) {
  const errors = event.detail[0]
  const container = $('#error-container')
  container.empty()
  for (message in errors) {
    container.append($('<div class="alert alert-danger"></div>').append(`${message} ${errors[message]}`))
  }
})

$('.input-datepicker').datepicker({
  format: 'yyyy-mm-dd',
})
