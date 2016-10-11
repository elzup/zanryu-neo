class CsvsController < ApplicationController
  def index
    unless params[:next]
      requests = Request.current_month.where(admin_id: current_user.id)
    else
      requests = Request.next_month.where(admin_id: current_user.id)
    end
    csv = Request.to_csv(requests)
    respond_to do |format|
      format.csv { send_data csv }
    end
  end
end
