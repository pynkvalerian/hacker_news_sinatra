# INDIVIDUAL POST PAGE
get '/posts/:id' do
  if session[:user_id].nil? == false
    @user = User.find(session[:user_id])
  end

  @post = Post.find(params[:id])
  @all_comments = @post.comments.sort_by {|post| post.created_at}

  erb :post
end

get '/new_post' do
  @user = User.find(session[:user_id])
  erb :new_post
end

# ADD NEW POST
post '/new_post' do
  title = params[:title]
  description = params[:description]

  new_post = Post.create(title: title, description: description, user_id: session[:user_id])

redirect to("/posts/#{new_post.id}")
end