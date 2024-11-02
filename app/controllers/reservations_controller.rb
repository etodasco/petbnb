class ReservationsController < ApplicationController
    def new
      @pet = Pet.find(params[:pet_id])
      @reservation = Reservation.new
    end
    def create
      @pet = Pet.find(params[:pet_id])
      @reservation = Reservation.new(reservation_params)
      @reservation.user = current_user
      @reservation.pet = @pet
      @reservation.status = "pending"

      if @reservation.save
        redirect_to pet_path(@pet), notice: "Reservation created successfully!"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def index
      @reservations = Reservation.all
    end

    private

    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date)
    end
end
