def vote_count
  upvotes = post.votes.where(upvote: true).count
  downvotes = post.votes.where(upvote: false).count
  total_votes = upvotes - downvotes
end
