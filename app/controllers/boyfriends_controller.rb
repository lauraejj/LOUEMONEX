class BoyfriendsController < ApplicationController

def search
end

  def index
    @boyfriends = Boyfriend.all
  end

end
