require 'test_helper'

class SalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sale = sales(:one)
  end

  test 'should get index' do
    get sales_url
    assert_response :success
  end

  test 'should get new' do
    get new_sale_url
    assert_response :success
  end

  test 'should create sale' do
    assert_difference('Sale.count') do
      post sales_url,
           params: { sale: { admin_id: @sale.admin_id, buyer_id: @sale.buyer_id, lead_id: @sale.lead_id,
                             mortgage_cleared: @sale.mortgage_cleared, property_verified: @sale.property_verified, sale_date: @sale.sale_date, sale_time: @sale.sale_time, seller_id: @sale.seller_id } }
    end

    assert_redirected_to sale_url(Sale.last)
  end

  test 'should show sale' do
    get sale_url(@sale)
    assert_response :success
  end

  test 'should get edit' do
    get edit_sale_url(@sale)
    assert_response :success
  end

  test 'should update sale' do
    patch sale_url(@sale),
          params: { sale: { admin_id: @sale.admin_id, buyer_id: @sale.buyer_id, lead_id: @sale.lead_id,
                            mortgage_cleared: @sale.mortgage_cleared, property_verified: @sale.property_verified, sale_date: @sale.sale_date, sale_time: @sale.sale_time, seller_id: @sale.seller_id } }
    assert_redirected_to sale_url(@sale)
  end

  test 'should destroy sale' do
    assert_difference('Sale.count', -1) do
      delete sale_url(@sale)
    end

    assert_redirected_to sales_url
  end
end
