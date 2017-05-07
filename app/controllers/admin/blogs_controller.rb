class Admin::BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin?
  layout 'admin'

  def index
    @slider_link_1 = Link.where(link_type: 'slider-1').first
    @slider_link_2 = Link.where(link_type: 'slider-2').first
    @slider_link_3 = Link.where(link_type: 'slider-3').first
    @total_popularities = Popularity.where(article_id:0).first.popularity
    @today = Date.today
    @today_popularities = Popularity.where(article_id:1,created_at: @today.beginning_of_day..@today.end_of_day).first.popularity
  end

  private

  def admin?
    if !current_user.admin
      redirect_to blogs_path
    end
  end
end
