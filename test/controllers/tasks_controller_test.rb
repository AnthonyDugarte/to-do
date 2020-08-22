require('test_helper')

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line = lines(:to_do)
    @line_2 = lines(:doing)
    @task = tasks(:do_tests)
  end

  test 'should get index' do
    get tasks_url
    assert_response :success
  end

  test 'should get tasks from list' do
    get url_for([@line, :tasks])
    assert_response :success
  end

  test 'should get new' do
    get new_task_url
    assert_response :success
  end

  test 'should get new for line' do
    get url_for([:new, @line, :task])

    assert_response :success
  end

  test 'should create task' do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { description: @task.description, title: @task.title, line_id: @task.line_id } }
    end

    assert_redirected_to task_url(Task.last)
  end

  test 'should create task for lane' do
    assert_difference('Task.count') do
      post url_for([@line, :tasks]), params: { task: { description: @task.description, title: @task.title } }
    end

    assert_redirected_to url_for([@line, Task.last])
    assert_equal @line.id, Task.last.line_id
  end

  test 'should create task for lane specified at url and not at params' do
    assert_difference('Task.count') do
      post url_for([@line, :tasks]), params: { task: { description: @task.description, title: @task.title, line_id: @line_2.id } }
    end

    assert_redirected_to url_for([@line, Task.last])
    assert_not @line.id == @line_2.id
    assert_equal @line.id, Task.last.line_id
  end

  test 'should show task' do
    get task_url(@task)
    assert_response :success
  end

  test 'should get edit' do
    get edit_task_url(@task)
    assert_response :success
  end

  test 'should update task' do
    patch task_url(@task), params: { task: { description: @task.description, title: @task.title, line_id: @task.line_id } }
    assert_redirected_to task_url(@task)
  end

  test 'should not update task lane if specified by url' do
    assert_no_changes 'Task.find(@task.id).line_id' do
      patch url_for([@line, @task]), params: { task: { line_id: @line_2.id } }
    end

    assert_redirected_to url_for([@line, @task])
  end

  test 'should destroy task' do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end

  test 'should destroy task associated to a lane' do
    assert_difference('@line.tasks.count', -1) do
      delete url_for([@line, @task])
    end

    assert_redirected_to url_for([@line, :tasks])
  end
end
