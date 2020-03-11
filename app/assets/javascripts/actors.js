$('.input-datepicker').datepicker({
  format: 'yyyy-mm-dd',
})

function getURLFile(target, callback) {
  if (target.files && target.files[0]) {
    const reader = new FileReader()
    reader.onload = function(e) {
      callback(e.target.result)
    }

    reader.readAsDataURL(target.files[0])
  }
}

function getURLFile(target, callback) {
  if (target.files && target.files[0]) {
    const reader = new FileReader()
    reader.onload = function(e) {
      callback(e.target.result)
    }

    reader.readAsDataURL(target.files[0])
  }
}

$('.actor-avatar-input').change(function () {
  getURLFile(this, (link) => {
    $('.actor-avatar').attr('src', link)
  })
})

$('.delete-avatar-btn').click(function () {
  const src = $('.actor-avatar').attr('data-src-default')
  $('.actor-avatar').attr('src', src)
})
