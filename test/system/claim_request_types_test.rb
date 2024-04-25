require "application_system_test_case"

class ClaimRequestTypesTest < ApplicationSystemTestCase
  setup do
    @claim_request_type = claim_request_types(:one)
  end

  test "visiting the index" do
    visit claim_request_types_url
    assert_selector "h1", text: "Claim request types"
  end

  test "should create claim request type" do
    visit claim_request_types_url
    click_on "New claim request type"

    fill_in "Name", with: @claim_request_type.name
    click_on "Create Claim request type"

    assert_text "Claim request type was successfully created"
    click_on "Back"
  end

  test "should update Claim request type" do
    visit claim_request_type_url(@claim_request_type)
    click_on "Edit this claim request type", match: :first

    fill_in "Name", with: @claim_request_type.name
    click_on "Update Claim request type"

    assert_text "Claim request type was successfully updated"
    click_on "Back"
  end

  test "should destroy Claim request type" do
    visit claim_request_type_url(@claim_request_type)
    click_on "Destroy this claim request type", match: :first

    assert_text "Claim request type was successfully destroyed"
  end
end
