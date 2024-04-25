require "application_system_test_case"

class ClaimRequestsTest < ApplicationSystemTestCase
  setup do
    @claim_request = claim_requests(:one)
  end

  test "visiting the index" do
    visit claim_requests_url
    assert_selector "h1", text: "Claim requests"
  end

  test "should create claim request" do
    visit claim_requests_url
    click_on "New claim request"

    fill_in "Amount", with: @claim_request.amount
    fill_in "Claim request type", with: @claim_request.claim_request_type_id
    fill_in "Status", with: @claim_request.status
    fill_in "User", with: @claim_request.user_id
    click_on "Create Claim request"

    assert_text "Claim request was successfully created"
    click_on "Back"
  end

  test "should update Claim request" do
    visit claim_request_url(@claim_request)
    click_on "Edit this claim request", match: :first

    fill_in "Amount", with: @claim_request.amount
    fill_in "Claim request type", with: @claim_request.claim_request_type_id
    fill_in "Status", with: @claim_request.status
    fill_in "User", with: @claim_request.user_id
    click_on "Update Claim request"

    assert_text "Claim request was successfully updated"
    click_on "Back"
  end

  test "should destroy Claim request" do
    visit claim_request_url(@claim_request)
    click_on "Destroy this claim request", match: :first

    assert_text "Claim request was successfully destroyed"
  end
end
