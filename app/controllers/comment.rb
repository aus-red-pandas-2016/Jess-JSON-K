get '/comment/new' do
  erb :"_comment"
end

post '/comment/new' do
  @user = User.find(session[:id])

  # @post = Post.find(title: params[:post_title], question: params[:question])
  # redirect "/post/#{@post.id}/show"
end
