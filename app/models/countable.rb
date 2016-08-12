module Countable

def vote_count
    upvotes = self.votes.where(upvote: true).count
    downvotes = self.votes.where(upvote: false).count
    total_votes = upvotes - downvotes
end

end
