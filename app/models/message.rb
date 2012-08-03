class Message < ActiveRecord::Base
  attr_accessible :body, :title, :user_id
  
  default_scope :order => "created_at DESC"
  
  belongs_to :user
  
  has_many :comments, :as => :commentable
  
  validates :user_id, :presence => true
  validates :title, :presence => true, :length => {:minimum => 5, :maximum => 50}
  validates :body, :presence => true
end
