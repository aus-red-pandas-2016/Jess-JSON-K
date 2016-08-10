get '/' do

  erb :index
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
