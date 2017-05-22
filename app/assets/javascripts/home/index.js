$(document).ready(function () {
  $('#new-link').on('submit', addLink)
})

function addLink (event) {
  event.preventDefault()
  var str = $('#new-link form').serialize()
  $.post('/links', str, function (data) {
    var $tr = $('<tr />')
    $tr.append($('<td />').text(data.title))
    $tr.append($('<td />').text(data.url))
    $('#all-links').prepend($tr)
    $('#new-link form')[0].reset()
  })
}
