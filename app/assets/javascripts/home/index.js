$(document).ready(function () {
  $('#new-link').on('submit', addLink)
})

function addLink (event) {
  event.preventDefault()
  var str = $('#new-link form').serialize()
  $.post('/links', str, function (data) {
    var $ul = $('<ul />').addClass('errors')
    if (data.error) {
      data.error.url.forEach(function (error) {
        var $li = $('<li />').text('URL ' + error)
        $ul.append($li)
      })
      $('#new-link').append($ul)
    }
    var $tr = $('<tr />')
    $tr.append($('<td />').text(data.title))
    $tr.append($('<td />').text(data.url))
    $tr.append($('<td />').text(data.read))
    $('#all-links').prepend($tr)
    $('#new-link form')[0].reset()
  })
}
