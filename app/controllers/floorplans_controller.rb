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
    @floorplan = Floorplan.new(floorplan_params)

    if @floorplan.save
      render json: @floorplan, status: :created, location: @floorplan
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
      params.require(:floorplan).permit(:name, :project_id)
    end
end
