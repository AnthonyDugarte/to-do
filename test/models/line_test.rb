require 'test_helper'

class LineTest < ActiveSupport::TestCase
  test "Line attributes must not be empty" do
    line = Line.new

    assert line.invalid?
    assert line.errors[:name].any?
  end

  test "Line without project should not be a valid one" do
    line = Line.new name: lines(:to_do).name

    assert line.invalid?
    assert line.errors[:project].any?
  end

  test "A line with project and name should be valid" do
    line = Line.new name: lines(:to_do).name, project_id: lines(:to_do).project_id

    assert line.valid?
  end
end
