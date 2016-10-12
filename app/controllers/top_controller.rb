class TopController < ApplicationController

  def index
    @professors = User.admin
    @rooms = Room.all
    if current_user.admin?
      @requests = current_user.admin_requests
      render :admin
    end
  end

end
