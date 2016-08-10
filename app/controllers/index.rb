get '' do

  erb :index
end

post '/login' do
  @user = User.find_by(params[:username])
  if @user.password == [params[:password]]
    session[:id] = @user.id
    erb :index
  else
    alert "Incorrect Username and/or Password\nTry Again"
    erb :login
  end
end
