require 'application_system_test_case'

class AssignmentsTest < ApplicationSystemTestCase
  setup do
    @assignment = assignments(:one)
  end

  test 'visiting the index' do
    visit assignments_url
    assert_selector 'h1', text: 'Assignments'
  end

  test 'should create assignment' do
    visit assignments_url
    click_on 'New assignment'

    fill_in 'Admin', with: @assignment.admin_id
    fill_in 'Company', with: @assignment.company_id
    fill_in 'Property', with: @assignment.property_id
    fill_in 'User', with: @assignment.user_id
    click_on 'Create Assignment'

    assert_text 'Assignment was successfully created'
    click_on 'Back'
  end

  test 'should update Assignment' do
    visit assignment_url(@assignment)
    click_on 'Edit this assignment', match: :first

    fill_in 'Admin', with: @assignment.admin_id
    fill_in 'Company', with: @assignment.company_id
    fill_in 'Property', with: @assignment.property_id
    fill_in 'User', with: @assignment.user_id
    click_on 'Update Assignment'

    assert_text 'Assignment was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Assignment' do
    visit assignment_url(@assignment)
    click_on 'Destroy this assignment', match: :first

    assert_text 'Assignment was successfully destroyed'
  end
end
