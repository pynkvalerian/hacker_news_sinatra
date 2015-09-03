$(document).ready(function() {

// VOTING FOR POSTS
  $("button#vote").click(function() {
    var postID = $(this).data("post-id");

    $.ajax ({
      url: "/posts/" + postID + "/vote",
      type: "POST",
      data: {post_id: postID},
      dataType: "json"
    })
    .done(function(data){
      $("div#post-vote-" + postID).html(data.msg + " " + data.vote_count + " votes");
    });
  });

// VOTING FOR COMMENTS
  $("button#comment-vote").click(function() {
    var commentID = $(this).data("comment-id");

    $.ajax ({
      url: "/comments/" + commentID + "/vote",
      type: "POST",
      data: {comment_id: commentID},
      dataType: "json"
    })
    .done(function(data){
      $("div#comment-vote-" + commentID).html(data.msg + " " + data.vote_count + " votes");
    });
  });

});
