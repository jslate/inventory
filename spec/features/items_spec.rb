require 'spec_helper'

describe Item do

  context 'index' do
    it 'displays and item' do
      item = FactoryGirl.create(:item)
      visit items_path
      page.should have_content item.name
    end
  end

end