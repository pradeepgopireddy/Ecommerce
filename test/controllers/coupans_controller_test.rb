require 'test_helper'

class CoupansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coupan = coupans(:one)
  end

  test "should get index" do
    get coupans_url
    assert_response :success
  end

  test "should get new" do
    get new_coupan_url
    assert_response :success
  end

  test "should create coupan" do
    assert_difference('Coupan.count') do
      post coupans_url, params: { coupan: { code: @coupan.code, discount: @coupan.discount, expriry_date: @coupan.expriry_date } }
    end

    assert_redirected_to coupan_url(Coupan.last)
  end

  test "should show coupan" do
    get coupan_url(@coupan)
    assert_response :success
  end

  test "should get edit" do
    get edit_coupan_url(@coupan)
    assert_response :success
  end

  test "should update coupan" do
    patch coupan_url(@coupan), params: { coupan: { code: @coupan.code, discount: @coupan.discount, expriry_date: @coupan.expriry_date } }
    assert_redirected_to coupan_url(@coupan)
  end

  test "should destroy coupan" do
    assert_difference('Coupan.count', -1) do
      delete coupan_url(@coupan)
    end

    assert_redirected_to coupans_url
  end
end
