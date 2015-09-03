# CREATE NEW USER UPON SIGN UP
post '/sign_up' do
  name = params[:name]
  email = params[:email]
  password = params[:password]
  confirm_password = params[:confirm_password]
  age = params[:age]
  country = params[:country]

  if password == confirm_password
    user = User.create(name: name, email: email, password: password, age: age, country: country)
  end

  redirect to "/users/#{user.id}"
end

# CHECKS LOG IN DETAILS
post '/log_in' do
  email = params[:email]
  password = params[:password]

  user = User.find_by email: email, password: password

  if user.nil?
    redirect to '/sign_up'
  else
    redirect to "/users/#{user.id}"
  end
end

# USER PROFILE PAGE
get '/users/:id' do
  @user = User.find(params[:id])
  session[:user_id] = @user.id

  all_posts = @user.posts.sort_by {|post| post.created_at}
  @all_posts = all_posts.reverse
  all_comments = @user.comments.sort_by {|comment| comment.created_at}
  @all_comments = all_comments.reverse

  erb :profile_page
end

# USER LOG OUT
get '/log_out' do
  session[:user_id] = nil

  redirect to('/')
end