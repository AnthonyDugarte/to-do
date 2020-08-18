require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:lapa)
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "creating a Project" do
    visit projects_url
    click_on "New Project"

    fill_in "Name", with: Faker::Lorem.word
    click_on "Create Project"

    assert_text "Project was successfully created"
  end

  test "updating a Project" do
    visit projects_url

    click_link @project.name, match: :first

    within resource_selector(@project) do
      click_on "Edit", match: :first
    end
    
    name = Faker::Lorem.word

    fill_in "Name", with: name
    click_on "Update Project"

    assert_selector "#{resource_selector @project} [data-field=\"name\"]", text: name, match: :first
  end

  test "destroying a Project" do
    visit projects_url

    click_link @project.name, match: :first

    within resource_selector(@project) do
      page.accept_confirm do
        click_on "X", match: :first
      end
    end

    assert_text "Project was successfully destroyed"
  end
end
