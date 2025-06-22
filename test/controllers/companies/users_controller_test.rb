require 'test_helper'

class Companies::UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get companies_users_new_url
    assert_response :success
  end

  test 'should get create' do
    get companies_users_create_url
    assert_response :success
  end
end
