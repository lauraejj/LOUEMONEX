class BoyfriendsController < ApplicationController

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
end
