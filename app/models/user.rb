class User < ActiveRecord::Base
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_secure_password
  has_many :events, foreign_key: 'organizer_id'
  has_many :reservations
  has_many :attended_events, through: :reservations, source: :event

  def name
    (first_name + ' ' + last_name).strip
  end

end
