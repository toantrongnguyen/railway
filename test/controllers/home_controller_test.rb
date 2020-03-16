require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_redirected_to controller: :sessions, action: :new
  end

  test "should get faq" do
    get home_faq_url
    assert_redirected_to controller: :sessions, action: :new
  end
end
