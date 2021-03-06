class BoyfriendsController < ApplicationController
before_action :authenticate_user!

  def search
  @boyfriend = params[:search]
  @results = Boyfriend.all.where('lower(name) LIKE :search', search: @boyfriend)
    # @boyfriend = @boyfriend.find(params[:ville, :description])
  end

  def index
    @boyfriends = Boyfriend.all
  end

  def show
    @boyfriend = Boyfriend.find(params[:id])
  end

  def new
    @boyfriend = Boyfriend.new
  end

  def create
    @boyfriend = Boyfriend.new(boyfriend_params)
    # @boyfriend = BoyfriendService.find(params[:service_id])
    @user = current_user
    # @boyfriend.boyfriend_service = @boyfriend
    @boyfriend.user = @user
    @boyfriend.save
    redirect_to new_boyfriend_path(@boyfriend)
  end

  private

  def boyfriend_params
    params.require(:boyfriend).permit(:name, :age, :ville, :description, :photos)
  end
end
