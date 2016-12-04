class CsvsController < ApplicationController
  def index
    unless params[:next]
      requests = current_user.admin_requests.current_month.fresh.future.includes([:user, :room, :admin])
    else
      requests = current_user.admin_requests.next_month.fresh.includes([:user, :room, :admin])
    end
    csv = Request.to_csv(requests)
    requests.update_all(exported: true)
    # mail
    ApplicationMailer.notice_applied(requests, current_user).deliver
    # username_year_month_timestamp.csv
    respond_to do |format|
      format.csv {
        send_data(csv, filename: filename)
      }
    end
  end

  private
  def filename
    return @filename if @filename
    day = params[:next] ? Date.today.next_month : Date.today
    month_str = day.strftime("%Y%m")
    timestamp_str = Time.now.strftime('t%Y%m%d%H%M%S')
    @filename = "zanryushinsei#{current_user.label}_#{month_str}_#{timestamp_str}.csv"
  end
end
