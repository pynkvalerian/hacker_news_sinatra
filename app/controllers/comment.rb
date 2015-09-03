# ADD NEW COMMENT
post '/posts/:id/comment' do
  text = params[:text]

  comment = Comment.create(post_id: params[:id], user_id: session[:user_id], text: text )

  redirect to("/posts/#{params[:id]}")
end