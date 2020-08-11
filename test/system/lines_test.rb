require "application_system_test_case"

class LinesTest < ApplicationSystemTestCase
  setup do
    @line = lines(:to_do)
  end

  test "visiting the index" do
    visit lines_url
    assert_selector "h1", text: "Lines"
  end

  test "creating a Line" do
    visit lines_url
    click_on "New Line"

    within("#modal-line-new") do
      fill_in "Name", with: @line.name
      click_on "Create Line"
    end

    assert_css resource_selector(Line.last)
  end

  test "updating a Line" do
    visit lines_url
    click_on "Edit", match: :first

    fill_in "Name", with: @line.name
    click_on "Update Line"

    assert_selector "#{resource_selector @line} [data-field=\"name\"]", text: @line.name, match: :first
  end

  test "destroying a Line" do
    visit lines_url

    assert_css resource_selector(Line.first)

    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_no_css resource_selector(Line.first)
  end
end
