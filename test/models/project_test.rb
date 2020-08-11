require 'test_helper'

class ProjectTest < ActiveSupport::TestCase  
  test "Project name should be unique" do
    project1 = Project.create name: Faker::Lorem.word
    assert project1.valid?

    project2 = Project.new name: project1.name
    assert project2.invalid?
    assert project2.errors[:name].any?
  end

  test "Project name should not be empty" do
    project = Project.new

    assert project.invalid?
    assert project.errors[:name].any?
  end

  test "Emptying the name of an existing project should not be valid" do
    project = Project.last
    project.name = ""

    assert project.invalid?
    assert project.errors[:name].any?
  end
end
