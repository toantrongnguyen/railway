$(document).on('turbolinks:load', function() {
  initReplyComment()
})

function initReplyComment() {
  $('.btn-reply').click(function() {
    $('.comment-list .clone-form').remove()
    const form = $('.form-comment').clone()
    form.addClass('clone-form')
    form.find('.comment_id').val($(this).attr('data-id'))
    $(this).parent().parent().parent().append(form)
  })
}
