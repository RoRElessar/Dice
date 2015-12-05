require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  test "should get idex" do
    get :idex
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
