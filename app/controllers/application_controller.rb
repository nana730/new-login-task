class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :require_login

  private

  def login_required
    unless current_user
      flash[:notice] = "ログインが必要です"
      redirect_to new_session_path
    end
  end
end
