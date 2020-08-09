require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  fixtures :tasks

  test "Task attributes must not be empty" do
    task = Task.new

    assert task.invalid?

    assert task.errors[:title].any?
    assert task.errors[:description].empty?
  end

  test "Task with out title should not be a valid one" do
    task_fixture = tasks(:do_tests)
    task = Task.new(line: task_fixture.line)

    assert task.invalid?

    assert task.errors[:title].any?
    assert task.errors.count == 1
  end

  test "Task with out line should not be a valid one" do
    task_fixture = tasks(:do_tests)
    task = Task.new(title: task_fixture.title)

    assert task.invalid?

    assert task.errors[:line].any?
    assert task.errors.count == 1
  end

  test "Task with a tittle and a line should be a valid one" do
    task_fixture = tasks(:do_tests)
    task = Task.new(title: task_fixture.title, line: task_fixture.line)

    assert task.valid?
  end
end
