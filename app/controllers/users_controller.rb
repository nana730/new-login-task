class UsersController < ApplicationController
skip_before_action :login_required, only: [:new, :create]
before_action :correct_user, only: [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:notice] = "アカウントを登録しました"
      redirect_to tasks_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    flash[:notice] = "アカウントを更新しました"
  end

  def edit
    @user = User.find(params[:id])
  end


    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to current_user unless current_user?(@user)
    end
end