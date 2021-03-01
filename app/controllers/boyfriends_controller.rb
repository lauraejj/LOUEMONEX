class BoyfriendsController < ApplicationController

  def show
    @boyfriend = Boyfriend.find(params[:id])
  end

end
