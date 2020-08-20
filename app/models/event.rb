class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendees,  dependent: :destroy
  has_many :attended_events, :through => :event_attendees, source: :event 
end
