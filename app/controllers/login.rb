get '/register' do
  erb :"users/new"
end

post '/user/new' do
  @user = User.new(username: params[:username])
  @user.password = params[:password]
  if @user.save
    session[:user] = @user.username
    redirect '/'
  else
    redirect '/register'
  end
end
