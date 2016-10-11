class TopController < ApplicationController

  def index
    @professors = User.admin
    @rooms = Room.all
    if current_user.admin?
      @requests = Request.all
      render :admin
    end
  end

end
