class Post < ActiveRecord::Base
  has_many :votes, as: :votable
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :answers
  include Countable

  def best_answer
    best_answer = self.answers.find_by(best_answer: true)
  end

end
