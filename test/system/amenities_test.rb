require 'application_system_test_case'

class AmenitiesTest < ApplicationSystemTestCase
  setup do
    @amenity = amenities(:one)
  end

  test 'visiting the index' do
    visit amenities_url
    assert_selector 'h1', text: 'Amenities'
  end

  test 'should create amenity' do
    visit amenities_url
    click_on 'New amenity'

    fill_in 'Amenity type', with: @amenity.amenity_type
    fill_in 'Capacity', with: @amenity.capacity
    fill_in 'Name', with: @amenity.name
    fill_in 'Property', with: @amenity.property_id
    click_on 'Create Amenity'

    assert_text 'Amenity was successfully created'
    click_on 'Back'
  end

  test 'should update Amenity' do
    visit amenity_url(@amenity)
    click_on 'Edit this amenity', match: :first

    fill_in 'Amenity type', with: @amenity.amenity_type
    fill_in 'Capacity', with: @amenity.capacity
    fill_in 'Name', with: @amenity.name
    fill_in 'Property', with: @amenity.property_id
    click_on 'Update Amenity'

    assert_text 'Amenity was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Amenity' do
    visit amenity_url(@amenity)
    click_on 'Destroy this amenity', match: :first

    assert_text 'Amenity was successfully destroyed'
  end
end
