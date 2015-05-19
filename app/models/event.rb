class Event < ActiveRecord::Base
  belongs_to :organizer, class_name: 'User'
  has_many :reservations
  has_many :guests, through: :reservations, source: :user

  scope :future, -> { where('held_at > ?', Time.now) }
  scope :past, -> { where('held_at < ?', Time.now) }

end
