post "/votes/up" do
  resource = Post.find(params[:_method].to_i)

  Vote.create(upvote: true, user_id: session[:id], votable_id: resource.id, votable_type: resource.class)
  redirect "/"

end

post "/votes/down" do


end


