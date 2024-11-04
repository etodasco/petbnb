class PetsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_pet, only: [:show, :destroy]
  def index
    @pets = Pet.all
    @markers = @pets.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to @pet, notice: "Pet was successfully created."
    else
      render :new
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path, notice: "Pet was successfully removed."
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :breed, :address, :image_url, :description)
  end
end

