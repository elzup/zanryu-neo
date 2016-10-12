class RequestsController < ApplicationController
  before_action :set_request, only: [:destroy]
  before_action :set_relations, only: [:create, :create_all, :destroy_all]
  before_action :set_month_date, only: [:create_all, :destroy_all]

  def create
    request = Request.create!(
        date: params[:date_str],
        user_id: @user.id,
        admin_id: @admin.id,
        room_id: @room.id,
    )
    render json: request
  rescue ActiveRecord::RecordNotUnique
    render json: { error: 'Already register.' }
  end

  def destroy
    @request.destroy
    render json: @request
  end

  def create_all
    register_dates = Request.select(:date).month(@d).map(&:date)
    requests = []
    ((@d..@d.at_end_of_month).step(1.day){}.to_a - register_dates).each do |d|
      requests << Request.new(
          date: d.strftime('%Y-%m-%d'),
          user_id: @user.id,
          admin_id: @admin.id,
          room_id: @room.id,
      )
    end
    Request.import(requests)
    render json: requests
  end

  def destroy_all
    render json: Request.month(@d).destroy_all
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  def set_relations
    @user = User.find(params[:user_id])
    @admin = User.find(params[:admin_id])
    @room = Room.find(params[:room_id])
  end

  def set_month_date
    year = params[:year].to_i
    month = params[:month].to_i
    @d = Date.new(year, month, 1)
  end

end
