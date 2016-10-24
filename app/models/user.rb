class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :requests
  scope :admin, -> { where('is_admin': true) }
  validates :email, presence: true, email: true
  validates :label, presence: true, format: { with: /\A[a-zA-Z]+\z/ }

  def student_id
    @student_id ||= email.split('@')[0]
  end

  def admin_requests
    @admin_requests ||= Request.where(admin_id: id).live
  end

  def admin?
    is_admin
  end
end
