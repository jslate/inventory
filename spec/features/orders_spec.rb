require 'spec_helper'

describe Order do

  context 'show' do
    it 'displays an order' do
      order = FactoryGirl.create(:order)
      visit order_path(order)
      page.should have_content order.number
    end
  end

  context 'create' do
    it 'enables the add button', js: true do
      visit new_item_path
      fill_in 'Name', with: 'Widget'
      fill_in 'Price', with: '300'
      fill_in 'Unit', with: 'dz'
      click_button 'Save'
      visit new_order_path
      page.should_not have_content 'Widget'
      fill_in 'order_item_quantity', with: '5'
      select('Widget', from: 'order_item_item')
      click_link 'add-item'
      sleep 1
      page.should have_content 'Widget'
    end
  end
end