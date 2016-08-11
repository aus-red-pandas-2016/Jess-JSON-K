class Answer < ActiveRecord::Base
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  belongs_to :post
  belongs_to :user

  def author
   author =  User.find(self.user_id).username
  end

end
