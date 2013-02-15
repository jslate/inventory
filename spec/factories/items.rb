# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    name 'Wafer'
    unit 'EA'
    unit_price '15.00'
  end
end
