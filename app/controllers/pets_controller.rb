class PetsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_pet, only: [:show, :destroy]

  def index
    @pets = Pet.all
    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {pet: pet}),
        marker_html: render_to_string(partial: "marker")
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
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path, notice: "Pet was successfully deleted."
  end  

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :breed, :address, :image_url, :description)
  end
end

