class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'

  def index
    @users = User.all
  end

  def admin_management
    @users = User.all
  end
end
