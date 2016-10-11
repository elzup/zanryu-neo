class RequestsController < ApplicationController
  before_action :set_room, only: [:destroy]

  def create
    user = User.find(params[:user_id])
    admin = User.find(params[:admin_id])
    room = Room.find(params[:room_id])
    request = Request.create(
        date: params[:date_str],
        user_id: user.id,
        admin_id: admin.id,
        room_id: room.id,
    )
    render json: request
  end

  def destroy
    @request.destroy
    render json: @request
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @request = Request.find(params[:id])
  end

end
