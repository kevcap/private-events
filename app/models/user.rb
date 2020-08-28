class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :invitations, foreign_key: :attendee_id
  has_many :attended_events, through: :invitations

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :username, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
end
