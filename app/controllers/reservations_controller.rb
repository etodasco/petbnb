class ReservationsController < ApplicationController
  class ReservationsController < ApplicationController
    def new
      @pet = Pet.find(params[:pet_id])
      @reservation = Reservation.new
    end
    def create
      @pet = Pet.find(params[:pet_id])
      @reservation = @pet.reservations.build(reservation_params)
      @reservation.user = current_user  # Assumes you have a current_user method

      if @reservation.save
        redirect_to pet_path(@pet), notice: "Reservation created successfully!"
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :status)
    end
  end
end
