class TopController < ApplicationController

  def index
    @professors = User.admin
    @rooms = Room.all
  end

end
