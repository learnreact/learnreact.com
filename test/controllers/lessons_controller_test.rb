require 'test_helper'

class LessonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson = lessons(:one)
  end

  test "should show lesson" do
    get lesson_url(@lesson)
    assert_response :success
  end
end
