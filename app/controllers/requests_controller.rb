class RequestsController < ApplicationController

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
  end

end
