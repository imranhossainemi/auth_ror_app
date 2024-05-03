class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:block, :unblock, :destroy]

  def index
    @users = User.all
  end
  
  def block
    @user.update(blocked: true)
    redirect_to admin_index_path
  end

  def unblock
    @user.update(blocked: false)
    redirect_to admin_index_path
  end

  def destroy
    @user.destroy
    redirect_to admin_index_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end