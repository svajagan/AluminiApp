class Event < ActiveRecord::Base
  attr_accessible :description, :event_at, :location, :title, :user_id

 
 has_many :comments, :as => :commentable

 belongs_to :user
 has_many :photos
 has_many :event_user_mappings
 has_many :users, :through => :event_user_mappings
 
  
 
end
