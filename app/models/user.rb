class User < ActiveRecord::Base
  before_save :skip_confirmation!
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :confirmable
  has_many :books
  validates_uniqueness_of :email
  enum role:  
  {
      user: 'user',
      admin: 'admin'
  }
end
