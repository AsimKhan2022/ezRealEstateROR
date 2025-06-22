require 'test_helper'

class PortalPageControllerTest < ActionDispatch::IntegrationTest
  test 'should get landing_page' do
    get portal_page_landing_page_url
    assert_response :success
  end

  test 'should get dashboard' do
    get portal_page_dashboard_url
    assert_response :success
  end
end
