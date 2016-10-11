class Room < ApplicationRecord
  has_many :requests

  def building_code
    code[0, 3]
  end
end
