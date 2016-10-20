class CsvsController < ApplicationController
  def index
    unless params[:next]
      requests = current_user.admin_requests.current_month.fresh.future.includes([:user, :room, :admin])
    else
      requests = current_user.admin_requests.next_month.fresh.includes([:user, :room, :admin])
    end
    csv = Request.to_csv(requests)
    requests.update_all(exported: true)
    respond_to do |format|
      format.csv { send_data csv }
    end
  end
end
