# INDIVIDUAL POST PAGE
get '/posts/:id' do
  if session[:user_id].nil? == false
    @user = User.find(session[:user_id])
  end

  @post = Post.find(params[:id])
  @all_comments = @post.comments.sort_by {|post| post.created_at}

  erb :post
end

# ADD NEW POST PAGE
get '/new_post' do
  @user = User.find(session[:user_id])
  erb :new_post
end

# ADD NEW POST TO DATABASE
post '/new_post' do
  title = params[:title]
  description = params[:description]

  new_post = Post.create(title: title, description: description, user_id: session[:user_id])

redirect to("/posts/#{new_post.id}")
end

# VOTE FOR POST
post '/posts/:id/vote' do
  post_id = params[:post_id]

  if session[:user_id].nil?
    redirect to('/log_in')
  else
    vote = PostVote.find_by(post_id: post_id, user_id: session[:user_id])
    if vote.nil?
      PostVote.create(post_id: post_id, user_id: session[:user_id])
      @votes = Post.find(post_id).post_votes.count
      {vote_count: @votes}.to_json
    else
      @votes = Post.find(post_id).post_votes.count
      {vote_count: @votes, msg: "You can only vote once!"}.to_json
    end
  end

  # CAN ONLY PASS DATA TO AJAX IN TWO FORMS:
  # 1. STRING
  # 2. JSON
end