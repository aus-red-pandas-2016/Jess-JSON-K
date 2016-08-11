get '/post/new' do
  erb :"posts/new"
end

post '/post/new' do
  p params
  @user = User.find(session[:id])
  @post = Post.new(title: params[:post_title], question: params[:question])
  if @post.save && @user
    @user.posts << @post
    redirect "/post/#{@post.id}/show"
  else
    redirect '/login'
  end

end

get '/post/:id/show' do
  @post = Post.find(params[:id])
  @author = User.find(@post.user_id).username

  erb :"posts/show"
end
