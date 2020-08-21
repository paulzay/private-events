class Event < ApplicationRecord
 
  has_and_belongs_to_many :creater, class_name: 'User'
  has_many :event_attendees,  dependent: :destroy
  has_many :attended_events, :through => :event_attendees, source: :event 
end
