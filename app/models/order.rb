class Order < ActiveRecord::Base
  attr_accessible :number
  has_many :order_items
end
