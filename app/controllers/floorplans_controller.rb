class FloorplansController < ApplicationController
  before_action :set_floorplan, only: [:show, :update, :destroy]

  # GET /floorplans
  def index
    @floorplans = Floorplan.all

    render json: @floorplans
  end

  # GET /floorplans/1
  def show
    render json: @floorplan
  end

  # POST /floorplans
  def create
    missing_project && return unless project

    @floorplan = Floorplan.new(floorplan_params)
    if @floorplan.save
      render json: @floorplan, status: :created
    else
      render json: @floorplan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /floorplans/1
  def update
    if @floorplan.update(floorplan_params)
      render json: @floorplan
    else
      render json: @floorplan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /floorplans/1
  def destroy
    @floorplan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_floorplan
      @floorplan = Floorplan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def floorplan_params
      params.require(:floorplan).permit(:name, :main_image)
        .merge(project_id: params[:project_id])
    end

    def project
      @project ||= Project.find_by_id(params[:project_id])
    end

    def missing_project
      render json: {
        error: "Missing project id param"
      }, status: :unprocessable_entity
    end
end
