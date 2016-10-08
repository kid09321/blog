class Admin::BlogsController < ApplicationController
  before_action :authenticate_user!
  layout :admin

  def index
    @users = User.all
  end

end
