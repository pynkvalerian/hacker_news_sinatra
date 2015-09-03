# HOME PAGE
get '/' do
  all_posts = Post.all.sort_by {|post| post.created_at}
  @all_posts = all_posts.reverse
  if session[:user_id].nil? == false
    @user = User.find(session[:user_id])
  end
  erb :index
end

# LOG IN
get '/log_in' do
erb :login_signup
end

# SIGN UP
get '/sign_up' do
  erb :login_signup
end