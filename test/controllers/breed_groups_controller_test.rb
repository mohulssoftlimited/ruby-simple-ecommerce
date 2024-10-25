require "test_helper"

class BreedGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get breed_groups_index_url
    assert_response :success
  end

  test "should get show" do
    get breed_groups_show_url
    assert_response :success
  end
end
