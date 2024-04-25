require "test_helper"

class ClaimRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @claim_request = claim_requests(:one)
  end

  test "should get index" do
    get claim_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_claim_request_url
    assert_response :success
  end

  test "should create claim_request" do
    assert_difference("ClaimRequest.count") do
      post claim_requests_url, params: { claim_request: { amount: @claim_request.amount, claim_request_type_id: @claim_request.claim_request_type_id, status: @claim_request.status, user_id: @claim_request.user_id } }
    end

    assert_redirected_to claim_request_url(ClaimRequest.last)
  end

  test "should show claim_request" do
    get claim_request_url(@claim_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_claim_request_url(@claim_request)
    assert_response :success
  end

  test "should update claim_request" do
    patch claim_request_url(@claim_request), params: { claim_request: { amount: @claim_request.amount, claim_request_type_id: @claim_request.claim_request_type_id, status: @claim_request.status, user_id: @claim_request.user_id } }
    assert_redirected_to claim_request_url(@claim_request)
  end

  test "should destroy claim_request" do
    assert_difference("ClaimRequest.count", -1) do
      delete claim_request_url(@claim_request)
    end

    assert_redirected_to claim_requests_url
  end
end
