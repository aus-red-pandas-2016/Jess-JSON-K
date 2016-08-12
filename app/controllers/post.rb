before "/post/*" do
  if !request.get?
    if !current_user
      redirect "/login"
    end
  end
end

get '/post/new' do
  erb :"posts/new"
end

post '/post/new' do
  p params
  @user = User.find(session[:id])
  @post = Post.new(title: params[:post_title], question: params[:question])
  if @post.save && @user
    @user.posts << @post
    redirect "/post/#{@post.id}"
  else
    redirect '/login'
  end

end

get '/post/:id' do
  @post = Post.find(params[:id])
  @author = User.find(@post.user_id).username
  erb :"posts/show"
end

post '/post/:id' do
  @user = User.find(session[:id])
  @post = Post.find(params[:id])
  @answer = Answer.new(description: params[:your_answer])
  if @user && @answer.save
    @user.answers << @answer
    @post.answers << @answer
    redirect "/post/#{@post.id}"
  else
    redirect '/login'
  end
end

get '/post/:id/:answer_id' do
  @user = User.find(session[:id])
  @post = Post.find(params[:id])
  @answer = Answer.find(params[:answer_id])
  if @user == @post.user
    @answer.best_answer = true
    @answer.save
    @post.best_answer
    redirect "/post/#{@post.id}"
  end
end

