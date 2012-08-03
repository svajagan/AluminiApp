class Comment < ActiveRecord::Base
  attr_accessible :comment
  belongs_to :commentable, polymorphic: true
  belongs_to :user
end
