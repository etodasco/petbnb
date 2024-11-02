class PetsController < ApplicationController
    before_action :authenticate_user!, only: :index
    def index
      @pets = Pet.all
      @markers = @flats.geocoded.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude
        }
      end
    end
    def show
      @pet = Pet.find(params[:id])
    end
end
