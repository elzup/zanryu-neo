class CsvsController < ApplicationController
  def index
    data = { hoge: 'ok' }
    month = params['m'] || Date.today.month

    requests = Request.current_month.where(admin_id: current_user.id)
    csv = Request.to_csv(requests)
    respond_to do |format|
      format.csv { send_data csv }
    end
  end
end
