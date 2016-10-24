class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_complete_userinfo!
  protect_from_forgery with: :exception

  private
  def check_complete_userinfo!
    if current_user.label == ''
      redirect_to edit_user_registration_path, notice: 'ユーザの表示名が必須になりました。登録お願いします。'
    end
  end

end
