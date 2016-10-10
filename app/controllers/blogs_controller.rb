class BlogsController < ApplicationController
  before_action :get_instagram_posts

  def index
    @instagram_posts = Instagram::InstagramPosts.new('self','635574010.1677ed0.cdd432f04d92473cac4e6927dd47bfde
').get_posts
    @posts = JSON.parse(@instagram_posts)['data']

    @articles = Article.all

  end

  def show
    @article = Article.find(params[:id])
  end
  def about
  end

  private

  def get_instagram_posts
    @instagram_posts = Instagram::InstagramPosts.new('self','635574010.1677ed0.cdd432f04d92473cac4e6927dd47bfde
').get_posts
    @posts = JSON.parse(@instagram_posts)['data']
  end
end
