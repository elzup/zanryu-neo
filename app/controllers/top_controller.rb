class TopController < ApplicationController

  def index
    @professors = User.admin
    @rooms = Room.all
    if current_user.admin?
      @requests = current_user.admin_requests.live.includes([:room, :user])
      @current_count = current_user.admin_requests.current_month.fresh.count
      @next_count = current_user.admin_requests.next_month.fresh.count
      @current_exported_count = current_user.admin_requests.current_month.not_fresh.count
      @next_exported_count = current_user.admin_requests.next_month.not_fresh.count
      render :admin
    end
    @requests = current_user.requests.live.includes([:room, :admin])
  end
end
