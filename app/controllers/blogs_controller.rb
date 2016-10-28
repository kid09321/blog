class BlogsController < ApplicationController
  before_action :get_instagram_posts
  before_action :all_categories

  def index
    @page = params[:page].present? ? params[:page] : 1
    @page = @page.to_i
    Rails.logger.info("========page#{@page}")
    @articles_per_page = 4
    @all_pages = (Article.all.size.to_f / @articles_per_page).ceil
    Rails.logger.info("========all-page#{@all_pages}")
    @instagram_posts = Instagram::InstagramPosts.new('self','635574010.1677ed0.cdd432f04d92473cac4e6927dd47bfde
').get_posts
    @posts = JSON.parse(@instagram_posts)['data']
    @articles = Article.all.limit(@articles_per_page).offset(@articles_per_page * @page - 4)
    @slider_link_1 = Link.where(link_type: 'slider-1').first
    @slider_link_2 = Link.where(link_type: 'slider-2').first
    @slider_link_3 = Link.where(link_type: 'slider-3').first
  end

  def show
    @article = Article.find(params[:id])
  end

  def about
    render :layout => 'about'
  end

  private

  def get_instagram_posts
    @instagram_posts = Instagram::InstagramPosts.new('self','635574010.1677ed0.cdd432f04d92473cac4e6927dd47bfde
').get_posts
    @posts = JSON.parse(@instagram_posts)['data']
  end

  def all_categories
    @categories = Category.all
  end
end
