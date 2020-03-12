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

$('.select-actor').select2();

$('.select-actor').on('change', function () {
  const actorIdlist = $(this).val()

  const parent = $('.actor-thumbnails')

  $('.actor-thumbnails li:not(.item-sample)').remove()

  actorIdlist.forEach(id => {
    const item = $('.actor-thumbnails__item.item-sample').clone()
      .removeClass('item-sample')
    const picture = item.find('img')
    const actor = actors.find(actor => actor.id == id)
    if (actor && actor.picture) {
      picture.attr('src', actor.picture)
    }
    parent.append(item)
  })
})
