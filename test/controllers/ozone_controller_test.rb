require 'test_helper'

class OzoneControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ozone_index_url
    assert_response :success
  end

end
