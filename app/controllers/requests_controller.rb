class RequestsController < ApplicationController
  before_action :set_request, only: [:destroy]
  before_action :set_relations, only: [:create, :create_all, :destroy_all]
  before_action :set_month_date, only: [:create_all, :destroy_all]

  def create
    request = current_user.requests.find_or_create_by(
        date: params[:date_str],
        admin_id: @admin.id,
        room_id: @room.id
    )
    request.deleted = false
    request.save!
    render json: request
  rescue ActiveRecord::RecordNotUnique
    render json: { error: 'Already register.' }
  end

  def destroy
    @request.deleted = true
    @request.save
    render json: @request
  end

  def create_all
    requests = []
    (@d..@d.at_end_of_month).step do |d|
      requests << request = current_user.requests.find_or_create_by(
          date: d.strftime('%Y-%m-%d'),
          admin_id: @admin.id,
          room_id: @room.id,
      )
      request.deleted = false
      request.save
    end
    render json: requests
  end

  def destroy_all
    requests = current_user.requests.month(@d).where(admin_id: params[:admin_id])
    requests.update_all(deleted: true)
    render json: requests
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  def set_relations
    @admin = User.find(params[:admin_id])
    @room = Room.find(params[:room_id])
  end

  def set_month_date
    year = params[:year].to_i
    month = params[:month].to_i
    @d = Date.new(year, month, 1)
  end

end
