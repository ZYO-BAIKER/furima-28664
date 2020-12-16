import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },
  received(data) {
    const html = `<p><strong><a href="/users/${data.user.id}"> ${data.user.nickname}</a> :</strong>${data.content.text} </p> `;
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment_text');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value='';
    const submit =  document.getElementById("submit-btn")
    submit.disabled = false
  }
});
