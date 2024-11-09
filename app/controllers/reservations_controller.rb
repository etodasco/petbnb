class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end
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

    if Reservation.pet_available?(@pet, @reservation.start_date, @reservation.end_date)
      if @reservation.save
        redirect_to pet_path(@pet), notice: "Reservation created successfully!"
      else
        render :new, status: :unprocessable_entity
      end
    else
      flash[:error] = "Sorry, the pet is not available for the selected dates."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @pet = Pet.find(params[:pet_id])
    @reservation = @pet.reservations.find(params[:id])

    if @reservation.destroy
      redirect_to pet_reservations_path(@pet), notice: "Reservation deleted successfully."
    else
      redirect_to pet_reservations_path(@pet), alert: "Failed to delete reservation."
    end
  end
  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
