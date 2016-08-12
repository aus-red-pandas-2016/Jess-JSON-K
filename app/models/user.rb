class User < ActiveRecord::Base
  has_many :votes
  has_many :comments
  has_many :answers
  has_many :posts
  validates :username, uniqueness: true
  include Countable

  def password
    @password ||= BCrypt::Password.new(original_pw)
  end

  def password=(encrypted_pw)
    @password = BCrypt::Password.create(encrypted_pw)
    self.original_pw = @password
  end

end
