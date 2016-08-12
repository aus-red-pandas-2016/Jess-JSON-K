get '/register' do
  erb :"users/new"
end

post '/user/new' do
  @user = User.new(username: params[:username])
  @user.password = params[:password]
  if @user.save
    session[:id] = @user.id
    # puts session[:user]
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
      @user.password == params[:original_pw]
      session[:id] = @user.id
      redirect "/"
  else
    #put an alert here
    redirect "/login"
  end

end



get '/logout' do
  if session[:id]
    session.delete(:id)
  end
  redirect "/"
end

get '/session_viewer' do
  session.inspect
end

get '/user/:id' do
  @user = User.find(session[:id])
  erb :"users/show"
end


