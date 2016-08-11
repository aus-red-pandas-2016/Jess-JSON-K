get '/comment/new' do
  @lineage = params[:resource]
  erb :"comment/new"
end

post '/comment/new' do
  @user = User.find(current_user)
  @post = Post.find(params[:post_id])
  @comment = @post.comments.create(description: params[:comment], user_id: @user.id)
  @post.save
  if request.xhr?
    erb(:"comment/show", layout: false)
  else
    redirect "/post/#{@post.id}/show"
  end
end

delete '/comment/:id' do
end
