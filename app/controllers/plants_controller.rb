class PlantsController < ApplicationController

    def index
        # byebug
        plants = Plant.all
        render json: plants, status: :ok  
    end

    def create
        # byebug
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end

    def show
        # byebug
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant, status: :ok
        else 
            render json: {error: "Plant not found"}, status: :not_found
        end
    end

    private

    def plant_params
        params.permit(:name, :image, :price)
    end

end
