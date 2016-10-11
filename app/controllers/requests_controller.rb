class RequestsController < ApplicationController

  def index
  end

  def create
    user = User.admin.find(params[:admin_id])
    room = Room.find(params[:room_id])
    binding.pry
    request = Request.create(
        date: Time.new(2016, 10, 11, 0, 0, 0, 0)
    )
    user.requests << request
    room.requests << request

    render json: request
  end

  def destroy
  end

end
