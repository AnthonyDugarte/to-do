require('test_helper')

class LinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line = lines(:to_do)

    @project_lapa = projects(:lapa)
    @project_grillo = projects(:grillo)
  end

  test 'should get index' do
    get lines_url
    assert_response :success
  end

  test 'should get index for project lines' do
    get url_for([@project_lapa, Line])
    assert_response :success
  end

  test 'should get new' do
    get new_line_url
    assert_response :success
  end

  test 'should get new for a project line' do
    get url_for([:new, @project_grillo, :line])
    assert_response :success
  end

  test 'should create line' do
    assert_difference('Line.count') do
      post lines_url, params: { line: { name: @line.name, project_id: @line.project_id } }
    end

    assert_redirected_to line_url(Line.last)
  end

  test 'should create Line for project' do
    assert_difference('Line.count') do
      post url_for([@project_grillo, Line]), params: { line: { name: @line.name } }
    end

    assert_redirected_to url_for([@project_grillo, Line.last])
    assert_equal @project_grillo.id, Line.last.project_id
  end

  test 'should create Line for project specified at url and not at params' do
    assert_difference('Line.count') do
      post url_for([@project_grillo, Line]), params: { line: { name: @line.name, project_id: @project_lapa.id } }
    end

    assert_redirected_to url_for([@project_grillo, Line.last])
    assert_equal @project_grillo.id, Line.last.project_id
  end

  test 'should show line' do
    get line_url(@line)
    assert_response :success
  end

  test 'should get edit' do
    get edit_line_url(@line)
    assert_response :success
  end

  test 'should update line' do
    patch line_url(@line), params: { line: { name: @line.name } }
    assert_redirected_to line_url(@line)
  end

  test 'should not update project lane if specified by url' do
    assert_no_changes 'Line.find(@line.id).project_id' do
      patch url_for([@project_lapa, @line]), params: { line: { project_id: @project_grillo.id } }
    end

    assert_redirected_to url_for([@project_lapa, @line])
  end

  test 'should destroy line' do
    assert_difference('Line.count', -1) do
      delete line_url(@line)
    end

    assert_redirected_to lines_url
  end

  test 'should destroy line associated to a project' do
    assert_difference('@project_lapa.lines.count', -1) do
      delete url_for([@project_lapa, @line])
    end

    assert_redirected_to url_for([@project_lapa, Line])
  end

  test 'should destroy associated tasks' do
    assert_difference('Task.count', -2) do
      delete line_url(@line)
    end

    assert_redirected_to lines_url
  end
end
