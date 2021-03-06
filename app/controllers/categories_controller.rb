class CategoriesController < ApplicationController
  before_action :get_instagram_posts
  before_action :all_categories

  def show
    @category = Category.find_by_title(params[:id])
    @articles = Article.order("id DESC").where(category_id: @category.id)
    @page = params[:page].present? ? params[:page] : 1
    @page = @page.to_i
    Rails.logger.info("========page#{@page}")
    @articles_per_page = 4
    @all_pages = (@articles.size.to_f / @articles_per_page).ceil
    Rails.logger.info("========all-page#{@all_pages}")
    @instagram_posts = Instagram::InstagramPosts.new('self','4037665705.1677ed0.0fbe1530bc1b4acaa1cd5e60fd85abff').get_posts
    @posts = JSON.parse(@instagram_posts)['data']
    @articles = @articles.limit(@articles_per_page).offset(@articles_per_page * @page - 4)
  end

  private

  def get_instagram_posts
    @instagram_posts = Instagram::InstagramPosts.new('self','4037665705.1677ed0.0fbe1530bc1b4acaa1cd5e60fd85abff').get_posts
    @posts = JSON.parse(@instagram_posts)['data']
  end

  def all_categories
    @categories = Category.all
  end
end
