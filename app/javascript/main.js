const ROUTES = {
  movies: 0,
  actors: 1,
}

function onChangeRoute() {
  const path = /^\/(\w+)\/?/.exec(window.location.pathname)
  if (!path) {
    $('.menu-nav li').removeClass('active')
    return
  }
  const route = path[1]
  const index = ROUTES[route] || 0
  $('.menu-nav li').removeClass('active')
  $($('.menu-nav li')[index]).addClass('active')
}

$(document).on('turbolinks:load', function () {
  onChangeRoute()
})