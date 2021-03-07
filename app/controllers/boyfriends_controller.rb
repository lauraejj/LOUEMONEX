class BoyfriendsController < ApplicationController
before_action :authenticate_user!

 def index
    @boyfriends = Boyfriend.all
  end

  def search
    if params[:query].present?
      @boyfriend = Boyfriend.search_by_name_and_ville(params[:query])
      @results = @boyfriend
    else "No boyfriend found"
    end
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
    redirect_to root_path
  end

  def edit
    @boyfriend = Boyfriend.find(params[:id])
  end

  def update
    @boyfriend = Boyfriend.find(params[:id])
    @boyfriend.update(boyfriend_params)
    @boyfriend.save
    redirect_to root_path
  end

  def destroy
    @boyfriend = Boyfriend.find(params[:id])
    @boyfriend.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to root_path
  end

  private

  def boyfriend_params
    params.require(:boyfriend).permit(:name, :age, :ville, :description, :photos)
  end
end
