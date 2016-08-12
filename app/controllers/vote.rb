#resource is the id of the instance that the vote button is assigned to

post "/votes" do
  resource_id = params[:resource_id]
  resource_class = params[:resource_class]
  redirect_id = params[:post_resource_id]

  if params[:vote_result] == "Love it!"
    upvote_value = true
  else
    upvote_value = false
  end

  case resource_class
  when "Post"
    post = Post.find(resource_id)
    Vote.create(upvote: upvote_value, user_id: session[:id], votable_id: post.id, votable_type: post.class)
    redirect "/post/#{resource_id}"
  when "Answer"
    answer = Answer.find(resource_id)
    Vote.create(upvote: upvote_value, user_id: session[:id], votable_id: answer.id, votable_type: answer.class)
    redirect "/post/#{redirect_id}"
  end

end



