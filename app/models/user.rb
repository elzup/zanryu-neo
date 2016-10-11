class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :rooms
  has_many :requests
  scope :admin, -> { where('is_admin': true) }

  def student_id
    @student_id ||= email.split('@')[0]
  end
end
