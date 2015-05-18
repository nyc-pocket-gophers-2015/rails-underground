class User < ActiveRecord::Base
  has_secure_password
  has_many :events, foreign_key: 'organizer_id'
  has_many :reservations
  has_many :attended_events, through: :reservations, source: :event

end
