class Order < ActiveRecord::Base
  attr_accessible :number
  has_many :order_items
  before_create :generate_order_number

  def generate_order_number
    array = (0..9).to_a
    self.number = Array.new(10, '').collect { array[rand(array.size)] }.join
  end

end
