require "test_helper"

class InventariosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inventarios_index_url
    assert_response :success
  end

  test "should get create" do
    get inventarios_create_url
    assert_response :success
  end

  test "should get read" do
    get inventarios_read_url
    assert_response :success
  end

  test "should get update" do
    get inventarios_update_url
    assert_response :success
  end
end
