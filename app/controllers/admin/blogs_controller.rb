class Admin::BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin?
  layout 'admin'

  def index
    @slider_link_1 = Link.where(link_type: 'slider-1').first
    @slider_link_2 = Link.where(link_type: 'slider-2').first
    @slider_link_3 = Link.where(link_type: 'slider-3').first
  end

  private

  def admin?
    if !current_user.admin
      redirect_to blogs_path
    end
  end
end
