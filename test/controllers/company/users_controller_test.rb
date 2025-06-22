require 'test_helper'

class Company::UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get company_users_new_url
    assert_response :success
  end

  test 'should get create' do
    get company_users_create_url
    assert_response :success
  end
end
