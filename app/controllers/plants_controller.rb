class PlantsController < ApplicationController

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  # PATCH /plants
  def update
    plant = find_plant
    plant.update(plant_params)
    render json: plant
  end

#DESTROY plant
def destroy
  plant = Plant.find_by(id: params[:id])
  plant.destroy
  head :no_content
end
  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end

  def find_plant
    Plant.find(params[:id])
  end
end
