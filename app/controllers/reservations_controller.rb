class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def new
    # we need @restaurant in our `simple_form_for`
    @boyfriend = Boyfriend.find(params[:boyfriend_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @boyfriend = Boyfriend.find(params[:boyfriend_id])
    @user = current_user
    @reservation.boyfriend = @boyfriend
    @reservation.user = @user
    @reservation.save

    redirect_to boyfriend_path(@boyfriend)
  end

  def edit
  end

  def dashboard
    @myreservations = Reservation.where(user:current_user)
    @myboyfriendsreservations = Reservation.joins(boyfriend: :user).where(user: current_user)
    # on obtient des arrays des resas
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to boyfriend_path(@reservation.boyfriend)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
