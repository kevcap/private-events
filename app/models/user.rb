class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :invitations, foreign_key: :attendee_id, class_name: 'Invitation'
  has_many :attended_events, through: :invitations, source: 'Event'
end
