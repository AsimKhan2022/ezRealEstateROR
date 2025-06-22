require 'application_system_test_case'

class TenantsTest < ApplicationSystemTestCase
  setup do
    @tenant = tenants(:one)
  end

  test 'visiting the index' do
    visit tenants_url
    assert_selector 'h1', text: 'Tenants'
  end

  test 'should create tenant' do
    visit tenants_url
    click_on 'New tenant'

    fill_in 'Admin', with: @tenant.admin_id
    fill_in 'Commission', with: @tenant.commission
    fill_in 'Down payment', with: @tenant.down_payment
    fill_in 'Lead', with: @tenant.lead_id
    fill_in 'Move in date', with: @tenant.move_in_date
    fill_in 'Move in time', with: @tenant.move_in_time
    fill_in 'Move out date', with: @tenant.move_out_date
    fill_in 'Move out time', with: @tenant.move_out_time
    fill_in 'Property condition', with: @tenant.property_condition
    fill_in 'Rent price', with: @tenant.rent_price
    fill_in 'Security deposit', with: @tenant.security_deposit
    fill_in 'Terms', with: @tenant.terms
    fill_in 'Title', with: @tenant.title
    fill_in 'Utility responsibility', with: @tenant.utility_responsibility
    click_on 'Create Tenant'

    assert_text 'Tenant was successfully created'
    click_on 'Back'
  end

  test 'should update Tenant' do
    visit tenant_url(@tenant)
    click_on 'Edit this tenant', match: :first

    fill_in 'Admin', with: @tenant.admin_id
    fill_in 'Commission', with: @tenant.commission
    fill_in 'Down payment', with: @tenant.down_payment
    fill_in 'Lead', with: @tenant.lead_id
    fill_in 'Move in date', with: @tenant.move_in_date
    fill_in 'Move in time', with: @tenant.move_in_time
    fill_in 'Move out date', with: @tenant.move_out_date
    fill_in 'Move out time', with: @tenant.move_out_time
    fill_in 'Property condition', with: @tenant.property_condition
    fill_in 'Rent price', with: @tenant.rent_price
    fill_in 'Security deposit', with: @tenant.security_deposit
    fill_in 'Terms', with: @tenant.terms
    fill_in 'Title', with: @tenant.title
    fill_in 'Utility responsibility', with: @tenant.utility_responsibility
    click_on 'Update Tenant'

    assert_text 'Tenant was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Tenant' do
    visit tenant_url(@tenant)
    click_on 'Destroy this tenant', match: :first

    assert_text 'Tenant was successfully destroyed'
  end
end
