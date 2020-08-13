class LinesController < ApplicationController
  before_action :set_project
  before_action :set_line, only: [:show, :edit, :update, :destroy]

  def index
    @lines = line_query.includes(:tasks).all
  end

  def show
  end

  def new
    @line = line_query.new optional_line_params
  end

  def edit
  end

  def create
    @line = line_query.new(line_params)

    respond_to do |format|
      if @line.save
        format.html { redirect_to url_for([@project, @line]), notice: 'Line was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @line }
      else
        format.html { render :new }
        format.js { render :new }
        format.json { render json: @line.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @line.update(line_params)
        format.html { redirect_to url_for([@project, @line]), notice: 'Line was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @line }
      else
        format.html { render :edit }
        format.js { render :edit }
        format.json { render json: @line.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @line.destroy
    respond_to do |format|
      format.html { redirect_to url_for([@project, Line]), notice: 'Line was successfully destroyed.' }
      format.js
      format.json { head :no_content }
    end
  end

  private
    def line_query
      Line.where(*line_scoping_params)
    end

    def set_project
      @project = Project.find(params[:project_id]) if not params[:project_id].nil?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_line
      @line = line_query.find(params[:id])
    end

    def optional_line_params
      begin
        line_params
      rescue ActionController::ParameterMissing
        ActionController::Parameters.new
      end
    end

    # Only allow a list of trusted parameters through.
    def line_params
      _params = params.require(:line).permit(:name, :project_id)
      _params = _params.except(:project_id) if not @project.nil?

      _params
    end

    def line_scoping_params
      params.permit(:project_id)
    end
end
