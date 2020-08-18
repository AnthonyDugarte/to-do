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

    name = Faker::Lorem.word
    get_lane = ->() { Line.find_by_name name }

    assert_nil get_lane.call

    fill_in "Name", with: name
    select Project.first.name, from: "Project"
    click_on "Create Line"

    sleep(0.05) # Wait for ajax

    assert_not_nil get_lane.call
    assert_css resource_selector(get_lane.call)
  end

  test "updating a Line" do
    visit lines_url

    within resource_selector(@line) do
      click_on "Edit", match: :first
    end

    name = Faker::Lorem.word

    fill_in "Name", with: name
    click_on "Update Line"

    assert_selector "#{resource_selector @line} [data-field=\"name\"]", text: name, match: :first
  end

  test "destroying a Line" do
    visit lines_url

    selector = resource_selector Line.first

    assert_css selector

    page.accept_confirm do
      within selector do
        click_on "Destroy", match: :first
      end
    end

    assert_no_css selector
  end
end
