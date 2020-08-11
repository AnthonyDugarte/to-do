class LinesController < ApplicationController
  before_action :set_line, only: [:show, :edit, :update, :destroy]

  def index
    @lines = Line.all
  end

  def show
  end

  def new
    @line = Line.new
  end

  def edit
  end

  def create
    @line = Line.new(line_params)

    respond_to do |format|
      if @line.save
        format.html { redirect_to @line, notice: 'Line was successfully created.' }
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
        format.html { redirect_to @line, notice: 'Line was successfully updated.' }
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
      format.html { redirect_to lines_url, notice: 'Line was successfully destroyed.' }
      format.js
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line
      @line = Line.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def line_params
      params.require(:line).permit(:name)
    end
end
