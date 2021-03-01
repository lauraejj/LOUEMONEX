class BoyfriendsController < ApplicationController
def search
  @boyfriend = @boyfriend.find(params[:ville, :description])
end

end
