require "test_helper"

class UserShowTest < ActionDispatch::IntegrationTest
  def setup
    @inactive_user = users(:inactive)
    @active_user = users(:michael)
  end

  test "should redirect when showing inactive user" do
    get user_path(@inactive_user)
    assert_redirected_to root_url
  end

  test "should show user when active user" do
    get user_path(@active_user)
    assert_response :success
    assert_template 'users/show'
  end
end
