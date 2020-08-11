class TasksController < ApplicationController
  before_action :set_line
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = tasks_query.preload(:line).all
  end

  def show
  end

  def new
    @task = tasks_query.new(optional_task_params)
  end

  def edit
  end

  def create
    @task = tasks_query.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to [@line, @task], notice: 'Task was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.js { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to [@line, @task], notice: 'Task was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render [:edit, @line] }
        format.js { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to [@line, :tasks], notice: 'Task was successfully destroyed.' }
      format.js
      format.json { head :no_content }
    end
  end

  private
    def tasks_query
      Task.where(*task_scoping_params)
    end

    def set_line
      @line = Line.find(params[:line_id]) if not params[:line_id].nil?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = tasks_query.find(params[:id])
    end

    def optional_task_params
      begin
        task_params
      rescue ActionController::ParameterMissing
        ActionController::Parameters.new
      end
    end

    # Only allow a list of trusted parameters through.
    def task_params
      _params = params.require(:task).permit(:title, :description, :line_id)
      _params = _params.except(:line_id) if not @line.nil?

      _params
    end

    def task_scoping_params
      params.permit(:line_id)
    end
end
