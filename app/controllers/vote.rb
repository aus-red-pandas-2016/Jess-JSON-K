post "/votes" do
  resource = Post.find(params[:_method])

  if params[:vote_result] == "Love it!"
    upvote_value = true
  else
    upvote_value = false
  end

  Vote.create(upvote: upvote_value, user_id: session[:id], votable_id: resource.id, votable_type: resource.class)
  redirect "/"

end



