class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :invitations, foreign_key: :attended_event_id
  has_many :attendees, through: :invitations

  validates :description, presence: true, length: { minimum: 3, maximum: 300 }
  validates :title, presence: true, length: { minimum: 3, maximum: 25 }
  validates :location, presence: true, length: { minimum: 3, maximum: 25 }
  validates :date, presence: true

  scope :upcoming_events, -> { where('date >= ?', Time.zone.now) }
  scope :previous_events, -> { where('date < ?', Time.zone.now) }
end
