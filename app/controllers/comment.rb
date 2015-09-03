# ADD NEW COMMENT
post '/posts/:id/comment' do
  text = params[:text]

  comment = Comment.create(post_id: params[:id], user_id: session[:user_id], text: text )

  redirect to("/posts/#{params[:id]}")
end

post '/comments/:id/vote' do
  comment_id = params[:comment_id]

  if session[:user_id].nil?
    redirect to('/log_in')
  else
    vote = CommentVote.find_by(comment_id: comment_id, user_id: session[:user_id])
    if vote.nil?
      CommentVote.create(comment_id: comment_id, user_id: session[:user_id])
      @votes = Comment.find(comment_id).comment_votes.count
      {vote_count: @votes, msg: "Yay! "}.to_json
    else
      @votes = Comment.find(comment_id).comment_votes.count
      {vote_count: @votes, msg: "You can only vote once!"}.to_json
    end
  end

  # CAN ONLY PASS DATA TO AJAX IN TWO FORMS:
  # 1. STRING
  # 2. JSON
end