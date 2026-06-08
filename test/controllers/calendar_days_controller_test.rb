require "test_helper"

class CalendarDaysControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get calendar_days_show_url
    assert_response :success
  end
end
