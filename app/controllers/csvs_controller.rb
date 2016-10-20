class CsvsController < ApplicationController
  def index
    unless params[:next]
      requests = current_user.admin_requests.current_month.future.includes([:user, :room, :admin])
    else
      requests = current_user.admin_requests.next_month.future.includes([:user, :room, :admin])
    end
    csv = Request.to_csv(requests)
    respond_to do |format|
      format.csv { send_data csv }
    end
  end
end
