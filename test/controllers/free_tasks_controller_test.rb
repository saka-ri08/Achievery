require "test_helper"

class FreeTasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get free_tasks_index_url
    assert_response :success
  end
end
