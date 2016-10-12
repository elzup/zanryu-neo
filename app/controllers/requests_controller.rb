class RequestsController < ApplicationController
  before_action :set_room, only: [:destroy]

  def create
    user = User.find(params[:user_id])
    admin = User.find(params[:admin_id])
    room = Room.find(params[:room_id])
    request = Request.create!(
        date: params[:date_str],
        user_id: user.id,
        admin_id: admin.id,
        room_id: room.id,
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
    user = User.find(params[:user_id])
    admin = User.find(params[:admin_id])
    room = Room.find(params[:room_id])
    year = params[:year]
    month = params[:month]
    t = Date.new(year.to_i, month.to_i, 1)
    requests = []
    (t..t.at_end_of_month).step(1) do |d|
      requests << Request.new(
          date: d.strftime('%Y-%m-%d'),
          user_id: user.id,
          admin_id: admin.id,
          room_id: room.id,
      )
    end
    r = Request.import requests
    render json: r
  end

  def destroy_all

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @request = Request.find(params[:id])
  end

end
