class Post < ActiveRecord::Base
  has_many :votes, as: :votable
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :answers


  def vote_count
    upvotes = self.votes.where(upvote: true).count
    downvotes = self.votes.where(upvote: false).count
    total_votes = upvotes - downvotes
  end

  def best_answer
    best_answer = self.answers.find_by(best_answer: true)
  end


end
