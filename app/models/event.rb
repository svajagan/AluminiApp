class Event < ActiveRecord::Base
  attr_accessible :description, :event_at, :location, :title, :user_id

 has_many :comments, :as => :commentable
end
