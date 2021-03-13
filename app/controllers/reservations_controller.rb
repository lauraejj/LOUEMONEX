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
    redirect_to confirmation_path
  end


  def dashboard
    # @myreservations : user acheteur
    @myreservations = Reservation.where(user: current_user)
    # @myboyfriendsreservations : user vendeur
    #
    @myboyfriendsreservations = []
    # récupérer les boyfriends du current user
    myboyfriends = Boyfriend.where(user: current_user)
    # itérer sur chaque boyfriend ajouter dans @myboyfriendsreservation les résas du boyfriend
    myboyfriends.each do |boyfriend|
      @myboyfriendsreservations << boyfriend.reservations
    end
    @myboyfriendsreservations.flatten!
  end

  def update
    @reservation = Reservation.find(params[:id])
    if params[:statut] == "confirmed"
      @reservation.statut = "confirmed"
    elsif params[:statut] == "refused"
      @reservation.statut = "refused"
    end
    @reservation.save
    redirect_to reservations_dashboard_path
  end


  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_dashboard_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :statut)
  end
end
