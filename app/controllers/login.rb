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

get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user
      @user.password == params[:password]
      session[:id] = @user.id
      redirect "/"
  else
    #put an alert here
    redirect "/login"
  end

end
