class Event < ApplicationRecord

  validates :name, presence: true, length: { minimum: 5, maximum: 30 } 
  validates :description, presence: true, length: { minimum: 10, maximum: 300 } 
  validates :location, presence: true, length: { minimum: 3, maximum: 30 } 
  validates :date, presence: true

  belongs_to :creator, class_name: 'User'
  has_many :invitations, foreign_key: 'attended_event_id'
  has_many :attendees, through: :invitations

  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date > ?', Date.today) }
end
