require 'test_helper'

class UniqsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @uniq = uniqs(:one)
  end

  test "should get index" do
    get uniqs_url
    assert_response :success
  end

  test "should get new" do
    get new_uniq_url
    assert_response :success
  end

  test "should create uniq" do
    assert_difference('Uniq.count') do
      post uniqs_url, params: { uniq: { request: @uniq.request, result: @uniq.result } }
    end

    assert_redirected_to uniq_url(Uniq.last)
  end

  test "should show uniq" do
    get uniq_url(@uniq)
    assert_response :success
  end

  test "should get edit" do
    get edit_uniq_url(@uniq)
    assert_response :success
  end

  test "should update uniq" do
    patch uniq_url(@uniq), params: { uniq: { request: @uniq.request, result: @uniq.result } }
    assert_redirected_to uniq_url(@uniq)
  end

  test "should destroy uniq" do
    assert_difference('Uniq.count', -1) do
      delete uniq_url(@uniq)
    end

    assert_redirected_to uniqs_url
  end
end
