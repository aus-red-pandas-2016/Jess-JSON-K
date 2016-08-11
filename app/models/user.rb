class User < ActiveRecord::Base
  has_many :votes
  has_many :comments
  has_many :answers
  has_many :posts

  validates :username, uniqueness: true

  def vote_count
      upvotes = self.votes.where(upvote: true).count
      downvotes = self.votes.where(upvote: false).count
      total_votes = upvotes - downvotes
  end

end
