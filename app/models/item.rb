class Item < ActiveRecord::Base
  attr_accessible :name, :unit, :unit_price
  validates_presence_of :name, :unit, :unit_price
end
