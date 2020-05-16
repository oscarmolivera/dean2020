class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :is_admin!

  private

  def admin?
    redirect_to root_path unless current_user&.admin
  end
end
