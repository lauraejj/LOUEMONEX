class ReservationsController < ApplicationController

  def new
    # we need @restaurant in our `simple_form_for`
    @boyfriend = Boyfriend.find(params[:boyfriend_id])
    @user = User.find(params[:user_id])
    @reservation = Reservation.new
  end

    def create
    @reservation = Reservation.new(reservation_params)
    @boyfriend = Boyfriend.find(params[:boyfriend_id])
    @user = User.find(params[:user_id])
    @reservation.boyfriend = @boyfriend
    @reservation.save
    redirect_to boyfriend_path(@boyfriend)
  end

    def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to boyfriend_path(@reservation.boyfriend)
  end

  private

  def reservation_params
  # params.require(:reservation).permit(:start_date, end_date)
  end
end
