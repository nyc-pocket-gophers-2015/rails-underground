class Check < ActiveRecord::Base
  belongs_to :reservation
  has_and_belongs_to_many :items
  
  def bottles_cost
    items.where(type: 'Bottle').sum(:price)
  end

  def mixers_cost
    items.where(type: 'Mixer').sum(:price)
  end

  def sub_total
    bottles_cost + mixers_cost
  end

  def gratuity
    sub_total * 0.18
  end

  def tax_due
    sub_total * 0.08
  end

  def total_bill
    sub_total + tax_due + gratuity
  end
end
