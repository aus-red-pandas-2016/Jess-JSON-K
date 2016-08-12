get '/comment/new' do
  # @lineage = params[:resource]
  erb :"comment/new"
end

post '/comment/new' do
  @user = User.find(current_user)
  @post = Post.find(params[:post_id])
  @answer = Answer.find(params[:resource_id])

  case params[:resource_class]
  when "Answer"
      Comment.create(description: params[:comment], user_id: @user.id, commentable_id: @answer.id, commentable_type: @answer.class.name)

  when "Post"
      Comment.create(description: params[:comment], user_id: @user.id, commentable_id: @post.id, commentable_type: @post.class.name)
  end

  if request.xhr?
    erb(:"comment/show", layout: false)
  else
    redirect "/post/#{@post.id}/show"
  end
end

delete '/comment/:id' do
end
