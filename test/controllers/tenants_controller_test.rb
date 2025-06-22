require 'test_helper'

class TenantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tenant = tenants(:one)
  end

  test 'should get index' do
    get tenants_url
    assert_response :success
  end

  test 'should get new' do
    get new_tenant_url
    assert_response :success
  end

  test 'should create tenant' do
    assert_difference('Tenant.count') do
      post tenants_url,
           params: { tenant: { admin_id: @tenant.admin_id, commission: @tenant.commission, down_payment: @tenant.down_payment,
                               lead_id: @tenant.lead_id, move_in_date: @tenant.move_in_date, move_in_time: @tenant.move_in_time, move_out_date: @tenant.move_out_date, move_out_time: @tenant.move_out_time, property_condition: @tenant.property_condition, rent_price: @tenant.rent_price, security_deposit: @tenant.security_deposit, terms: @tenant.terms, title: @tenant.title, utility_responsibility: @tenant.utility_responsibility } }
    end

    assert_redirected_to tenant_url(Tenant.last)
  end

  test 'should show tenant' do
    get tenant_url(@tenant)
    assert_response :success
  end

  test 'should get edit' do
    get edit_tenant_url(@tenant)
    assert_response :success
  end

  test 'should update tenant' do
    patch tenant_url(@tenant),
          params: { tenant: { admin_id: @tenant.admin_id, commission: @tenant.commission, down_payment: @tenant.down_payment,
                              lead_id: @tenant.lead_id, move_in_date: @tenant.move_in_date, move_in_time: @tenant.move_in_time, move_out_date: @tenant.move_out_date, move_out_time: @tenant.move_out_time, property_condition: @tenant.property_condition, rent_price: @tenant.rent_price, security_deposit: @tenant.security_deposit, terms: @tenant.terms, title: @tenant.title, utility_responsibility: @tenant.utility_responsibility } }
    assert_redirected_to tenant_url(@tenant)
  end

  test 'should destroy tenant' do
    assert_difference('Tenant.count', -1) do
      delete tenant_url(@tenant)
    end

    assert_redirected_to tenants_url
  end
end
