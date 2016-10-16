class Admin::BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin?
  layout 'admin'

  def index
  end

  private

  def admin?
    current_user.admin
  end
end
