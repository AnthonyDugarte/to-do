require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  fixtures :tasks

  test "Task attributes must not be empty" do
    task = Task.new

    assert task.invalid?

    assert task.errors[:title].any?
    assert task.errors[:description].empty?
  end

  test "Task with just a tittle should be a valid one" do
    task = Task.new(title: tasks(:one).title)

    assert task.valid?
  end
end
