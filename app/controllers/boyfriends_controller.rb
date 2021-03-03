class BoyfriendsController < ApplicationController

def search
  @boyfriend = @boyfriend.find(params[:ville, :description])
end

def index
  @boyfriends = Boyfriend.all
end

def show
  @boyfriend = Boyfriend.find(params[:id])
end

end
