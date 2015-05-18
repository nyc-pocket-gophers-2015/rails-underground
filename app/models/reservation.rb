class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_one :check

  def bottles
   @bottles ||= check.items.where(type: 'Bottle')
  end

  def mixers
   @mixers  ||= check.items.where(type: 'Mixer')
  end
end
