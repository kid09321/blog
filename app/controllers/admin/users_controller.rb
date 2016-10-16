class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin?
  layout 'admin'

  def index
    @users = User.all
  end

  def admin_management
    @users = User.all
  end

  private

  def admin?
    current_user.admin
  end
end
