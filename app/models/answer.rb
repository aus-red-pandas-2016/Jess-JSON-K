class Answer < ActiveRecord::Base
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  belongs_to :post
  belongs_to :user

  def author
   author =  User.find(self.user_id).username
  end

  def vote_count
    upvotes = self.votes.where(upvote: true).count
    downvotes = self.votes.where(upvote: false).count
    total_votes = upvotes - downvotes
  end

end
