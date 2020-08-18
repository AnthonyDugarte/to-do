require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:do_tests)
    @line = lines(:to_do)
    @line2 = lines(:doing)
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "Tasks"
  end

  test "creating a Task" do
    visit tasks_url
    click_on "New Task"

    fill_in "Title", with: @task.title
    fill_in "Description", with: @task.description

    select @task.line.name, from: "Line"

    click_on "Create Task"

    assert_css resource_selector(Task.last)
  end

  test "Creating a Task for a line" do
    visit url_for([@line, :tasks])

    click_on "New Task"

    fill_in "Title", with: @task.title
    fill_in "Description", with: @task.description

    click_on "Create Task"

    sleep(0.05) # Wait for ajax

    assert_css resource_selector(Task.last)
  end

  test "Creating a Task for lines" do
    visit lines_url

    line = Line.second

    assert_css resource_selector(line)

    within resource_selector(line) do
      click_on "New Task"
    end

    fill_in "Description", with: @task.description
    fill_in "Title", with: @task.title
    click_on "Create Task"

    assert_css resource_selector(line)
    assert_css resource_selector(Task.last)
    assert_css "#{resource_selector(line)} #{resource_selector(Task.last)}"
  end

  test "updating a Task" do
    visit tasks_url
    within resource_selector(@task) do
      click_on "Edit", match: :first
    end

    fill_in "Description", with: @task.description
    fill_in "Title", with: @task.title
    select @task.line.name, from: "Line"
    click_on "Update Task"

    assert_selector "#{resource_selector @task} [data-field=\"title\"]", text: @task.title
    assert_selector "#{resource_selector @task} [data-field=\"description\"]", text: @task.description
  end

  test "destroying a Task" do
    visit tasks_url

    assert_css resource_selector(Task.first)

    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_no_css resource_selector(Task.first)
  end
end
