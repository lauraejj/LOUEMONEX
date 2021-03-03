class BoyfriendsController < ApplicationController

def search
end

  def index
    @boyfriends = Boyfriend.all
  end

def show
  @boyfriend = Boyfriend.find(params[:id])
end

end
