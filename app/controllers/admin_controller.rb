class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[destroy ban_user unban_user]

  def index
    @users = User.excluding(current_user).all
  end

  def destroy
    @user.destroy
    redirect_to admin_index_path
  end

  def ban_user
    user = User.find(params[:id])
    user.lock_access!
    redirect_to admin_index_path
  end

  def unban_user
    user = User.find(params[:id])
    user.unlock_access!
    redirect_to admin_index_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
