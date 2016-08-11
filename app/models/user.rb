class User < ActiveRecord::Base
  has_many :votes
  has_many :comments
  has_many :answers
  has_many :posts

def vote_count
    upvotes = self.votes.where(upvote: true).count
    downvotes = self.votes.where(upvote: false).count
    total_votes = upvotes - downvotes
end

end
