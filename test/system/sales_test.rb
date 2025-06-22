require 'application_system_test_case'

class SalesTest < ApplicationSystemTestCase
  setup do
    @sale = sales(:one)
  end

  test 'visiting the index' do
    visit sales_url
    assert_selector 'h1', text: 'Sales'
  end

  test 'should create sale' do
    visit sales_url
    click_on 'New sale'

    fill_in 'Admin', with: @sale.admin_id
    fill_in 'Buyer', with: @sale.buyer_id
    fill_in 'Lead', with: @sale.lead_id
    check 'Mortgage cleared' if @sale.mortgage_cleared
    check 'Property verified' if @sale.property_verified
    fill_in 'Sale date', with: @sale.sale_date
    fill_in 'Sale time', with: @sale.sale_time
    fill_in 'Seller', with: @sale.seller_id
    click_on 'Create Sale'

    assert_text 'Sale was successfully created'
    click_on 'Back'
  end

  test 'should update Sale' do
    visit sale_url(@sale)
    click_on 'Edit this sale', match: :first

    fill_in 'Admin', with: @sale.admin_id
    fill_in 'Buyer', with: @sale.buyer_id
    fill_in 'Lead', with: @sale.lead_id
    check 'Mortgage cleared' if @sale.mortgage_cleared
    check 'Property verified' if @sale.property_verified
    fill_in 'Sale date', with: @sale.sale_date
    fill_in 'Sale time', with: @sale.sale_time
    fill_in 'Seller', with: @sale.seller_id
    click_on 'Update Sale'

    assert_text 'Sale was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Sale' do
    visit sale_url(@sale)
    click_on 'Destroy this sale', match: :first

    assert_text 'Sale was successfully destroyed'
  end
end
