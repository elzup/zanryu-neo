class TopController < ApplicationController

  def index
    @professors = User.admin
    @rooms = Room.all
    if current_user.admin?
      @requests = current_user.admin_requests.live.includes([:room, :user])
      render :admin
    end
    @requests = current_user.requests.live.includes([:room, :admin])
  end
end
