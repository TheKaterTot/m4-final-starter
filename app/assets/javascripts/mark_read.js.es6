$(document).ready(function (){
  $('body').on('click', '.mark-as-read', markAsRead)
})

function markAsRead (e) {
  e.preventDefault()

  var linkId = $(this).parent().data('link-id')
  debugger

  $.ajax({
    type: 'PATCH',
    url: '/api/v1/links/' + linkId,
    data: { read: true }
  }).then(updateLinkStatus)
    .fail(displayFailure)
}

function updateLinkStatus (link) {
  $(`.read-status[data-link-id=${link.id}]`).text(link.read)
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
