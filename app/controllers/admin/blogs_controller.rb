class Admin::BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin?
  layout 'admin'

  def index
  end

  private

  def admin?
    if !current_user.admin
      redirect_to blogs_path
    end
  end
end
