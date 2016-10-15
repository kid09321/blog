class Admin::BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_s3_bucket
  layout 'admin'

  def index
  end

  private
end
