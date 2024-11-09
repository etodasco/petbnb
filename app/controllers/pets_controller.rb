class PetsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_pet, only: [:show, :destroy]

  def index
    @pets = Pet.all
    if params[:address].present?
      @pets = @pets.where("address ILIKE ?", "%#{params[:address]}%")
    end

    # Only apply date filtering if both start_date and end_date are provided
    if params[:start_date].present? && params[:end_date].present?
      @pets = @pets.where("start_date >= ? AND end_date <= ?", params[:start_date], params[:end_date])
    # If only start_date is provided, filter for pets available from that date onwards
    elsif params[:start_date].present?
      @pets = @pets.where("start_date >= ?", params[:start_date])
    # If only end_date is provided, filter for pets available up until that date
    elsif params[:end_date].present?
      @pets = @pets.where("end_date <= ?", params[:end_date])
    end
    if @pets.empty?
      @no_pets_message = "No available pets"
    end
    # Geocode pets for map markers
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
    params.require(:pet).permit(
      :name, :breed, :address, :image_url, :description,
      pet_availabilities_attributes: [:available_from, :available_to]
    )
  end
end
