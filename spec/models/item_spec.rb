require 'spec_helper'

describe Item do

  it 'must have a name' do
    i = FactoryGirl.create(:item)
    i.should be_valid
    i.name = nil
    i.should_not be_valid
  end

  it 'must have a unit' do
    i = FactoryGirl.create(:item)
    i.should be_valid
    i.unit = nil
    i.should_not be_valid
  end

  it 'must have a unit price' do
    i = FactoryGirl.create(:item)
    i.should be_valid
    i.unit_price = nil
    i.should_not be_valid
  end

end
