require 'test_helper'

class LineTest < ActiveSupport::TestCase
  test "Line attributes must not be empty" do
    line = Line.new

    assert line.invalid?
    assert line.errors[:name].any?
  end
end
