class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5, maximum: 150 } 
  

  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :invitations, foreign_key: 'attendee_id'
  has_many :attended_events, through: :invitations
end
