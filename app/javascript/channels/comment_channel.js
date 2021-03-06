import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },
  received(data) {
    debugger
    const html = `<p><strong><a href="/users/${data.user.id}"> ${data.user.nickname}</a> :</strong>${data.comment.text}<a href="/items/${data.item.id}/comments/${data.comment.id}">:削除</a> </p> `;
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment_text');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value='';
    const submit =  document.getElementById("submit-btn")
    submit.disabled = false
  }
});