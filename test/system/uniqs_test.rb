require "application_system_test_case"

class UniqsTest < ApplicationSystemTestCase
  setup do
    @uniq = uniqs(:one)
  end

  test "visiting the index" do
    visit uniqs_url
    assert_selector "h1", text: "Uniqs"
  end

  test "creating a Uniq" do
    visit uniqs_url
    click_on "New Uniq"

    fill_in "Request", with: @uniq.request
    fill_in "Result", with: @uniq.result
    click_on "Create Uniq"

    assert_text "Uniq was successfully created"
    click_on "Back"
  end

  test "updating a Uniq" do
    visit uniqs_url
    click_on "Edit", match: :first

    fill_in "Request", with: @uniq.request
    fill_in "Result", with: @uniq.result
    click_on "Update Uniq"

    assert_text "Uniq was successfully updated"
    click_on "Back"
  end

  test "destroying a Uniq" do
    visit uniqs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Uniq was successfully destroyed"
  end
end
