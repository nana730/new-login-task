class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :correct_user, only: [:show, :new]

  def index
    if logged_in?
        @tasks = current_user.tasks
        flash.now[:notice] = 'ログインしました'
    else
        redirect_to session_path,notice:"ログインしてください"
      end
  end

  def new
    if logged_in?
    @task = current_user.tasks.new
    else
      redirect_to session_path,notice:"ログインしてください"
    end
  end

  def create
    if logged_in?
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: t('.created')
    else
      render :new
    end
    end
  end

  def show
    if logged_in?
      @task = Task.find(params[:id])
      else
        redirect_to session_path,notice:"ログインしてください"
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: t('.updated')
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: t('.destroyed')
  end

  private

    def set_task
      @task = Task.find(params[:id])
      #@task = current_user.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :content)
    end

    def correct_user
      @user = User.find(current_user.id)
      redirect_to current_user unless current_user?(@user)
    end
end
