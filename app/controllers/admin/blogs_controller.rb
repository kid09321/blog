class Admin::BlogsController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'

  def index
  end

  private
end
