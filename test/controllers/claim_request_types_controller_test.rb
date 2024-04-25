require "test_helper"

class ClaimRequestTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @claim_request_type = claim_request_types(:one)
  end

  test "should get index" do
    get claim_request_types_url
    assert_response :success
  end

  test "should get new" do
    get new_claim_request_type_url
    assert_response :success
  end

  test "should create claim_request_type" do
    assert_difference("ClaimRequestType.count") do
      post claim_request_types_url, params: { claim_request_type: { name: @claim_request_type.name } }
    end

    assert_redirected_to claim_request_type_url(ClaimRequestType.last)
  end

  test "should show claim_request_type" do
    get claim_request_type_url(@claim_request_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_claim_request_type_url(@claim_request_type)
    assert_response :success
  end

  test "should update claim_request_type" do
    patch claim_request_type_url(@claim_request_type), params: { claim_request_type: { name: @claim_request_type.name } }
    assert_redirected_to claim_request_type_url(@claim_request_type)
  end

  test "should destroy claim_request_type" do
    assert_difference("ClaimRequestType.count", -1) do
      delete claim_request_type_url(@claim_request_type)
    end

    assert_redirected_to claim_request_types_url
  end
end
