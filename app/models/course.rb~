class Course < ActiveRecord::Base
  attr_accessible :name
  
  default_scope :order => "created_at DESC"
  
  has_many :users, :dependent => :destroy
  
  validates :name ,:presence => true
end
