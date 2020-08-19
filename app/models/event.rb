class Event < ApplicationRecord
    belongs_to :user :class_name => "User"
    has_many :event_attendees :through => :event_attendees, source: :user
end
