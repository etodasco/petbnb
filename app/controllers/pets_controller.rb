class PetsController < ApplicationController
    before_action :authenticate_user!, only: :index
    def index
      @pets = Pet.all
    end
    def new
      @pet = Pet.new
end
    def create
      @pet = Pet.new(pet_params)
      if @pet.save
        redirect_to @pet, notice: "Pet was successfully created."
      else
        render :new
      end
    end
    def show
      @pet
    end

    private
    def set_pet
      @pet = Pet.find(params[:id])
    end

    def pet_params
      params.require(:pet).permit(:name, :breed, :address, :image_url, :description)
    end
end
