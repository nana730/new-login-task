class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :require_login

  private

  def require_login
    unless logged_in?
      flash[:notice] = "ログインしてください"
      redirect_to new_session_path
    end
    end
end
