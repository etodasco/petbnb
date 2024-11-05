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

    if @reservation.save
      redirect_to pet_path(@pet), notice: "Reservation created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      redirect_to reservations_path, notice: "Reservation deleted successfully."
    else
      redirect_to reservations_path, alert: "Failed to delete reservation."
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
