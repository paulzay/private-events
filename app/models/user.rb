class User < ApplicationRecord
  has_and_belongs_to_many :events,foreign_key: :creator_id, class_name: 'Event'
  has_many :event_attendees
  has_many :attended_events, :through => :event_attendees, :source => "event"
end
