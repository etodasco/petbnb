class PetsController < ApplicationController
    before_action :authenticate_user!, only: :index

    def index
        @pets = Pet.all
    end
    def show
      @pet = Pet.find(params[:id])
    end
end
