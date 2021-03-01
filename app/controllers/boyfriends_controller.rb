class BoyfriendsController < ApplicationController
def search
end

def show
  @boyfriend = Boyfriend.find(params[:id])
end

end
