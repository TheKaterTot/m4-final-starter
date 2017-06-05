$(document).ready(function (){
  $('body').on('click', '.mark-as-read', markAsRead)
  $('body').on('click', '.mark-as-unread', markAsUnread)
})

function markAsRead (e) {
  e.preventDefault()

  var linkId = $(this).parent().data('link-id')

  $.ajax({
    type: 'PATCH',
    url: '/api/v1/links/' + linkId,
    data: { read: true }
  }).then(updateLinkStatus)
    .fail(displayFailure)
}

function markAsUnread (e) {
  e.preventDefault()

  var linkId = $(this).parent().data('link-id')

  $.ajax({
    type: 'PATCH',
    url: '/api/v1/links/' + linkId,
    data: { read: false }
  }).then(updateLinkStatus)
    .fail(displayFailure)
}

function updateLinkStatus (link) {
  $(`.read-status[data-link-id=${link.id}]`).text(link.read)
  if (link.read == true) {
    $(`td[data-link-id=${link.id}] .mark-as-read`).text('Mark As Unread').removeClass('mark-as-read').addClass('mark-as-unread')
    $(`tr#link-${link.id}`).addClass('read')
  } else {
    $(`td[data-link-id=${link.id}] .mark-as-unread`).text('Mark As Read').removeClass('mark-as-unread').addClass('mark-as-read')
    $(`tr#link-${link.id}`).removeClass('read')
  }

}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
