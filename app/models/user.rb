class User < ActiveRecord::Base
  has_many :votes
  has_many :comments
  has_many :answers
  has_many :posts

  def count_all_votes
    self.comments.votes.count + self.answer.votes.count + self.posts.votes.count
  end
end
