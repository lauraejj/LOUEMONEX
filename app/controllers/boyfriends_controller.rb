class BoyfriendsController < ApplicationController
  def index
    @boyfriends = Boyfriends.all
  end
end
