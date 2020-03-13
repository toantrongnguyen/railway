$(document).on('turbolinks:load', function() {
  initDropzone()
  initSelectActor()
  initDeleteThumbnailButton()
  $('.input-datepicker').datepicker({
    format: 'yyyy-mm-dd',
  })
})

function initSelectActor() {
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
}

function initDropzone() {
  const dropzone = $('.movie-dropzone input')
  if (dropzone.length) {
    dropzone.change((e) => {
      $('.movie-dropzone-count .number').text(e.target.files.length)
      $('.movie-dropzone-count').removeClass('d-none')
    })
  }
}

function initDeleteThumbnailButton() {
  $('.btn-delete-thumbnail').bind('ajax:complete', function () {
    $(this).parent().remove()
  })
}
