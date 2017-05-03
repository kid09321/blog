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
    @instagram_posts = Instagram::InstagramPosts.new('self','4037665705.1677ed0.0fbe1530bc1b4acaa1cd5e60fd85abff').get_posts
    @posts = JSON.parse(@instagram_posts)['data']
    @articles = Article.all.order("id DESC").limit(@articles_per_page).offset(@articles_per_page * @page - 4)
    @slider_link_1 = Link.where(link_type: 'slider-1').first
    @slider_link_2 = Link.where(link_type: 'slider-2').first
    @slider_link_3 = Link.where(link_type: 'slider-3').first
    /每日人氣/
    @expire_time = Time.now.tomorrow.beginning_of_day
    @request_ip = request.env['REMOTE_ADDR']
    Rails.logger.info("=======expire_time = #{@expire_time}")
    Rails.logger.info("=======request_ip  = #{@request_ip}")
    if !cookies[:user_ip]
      home_page_popularity = Popularity.where(:article_id => 0).first
      home_page_popularity.popularity += 1
      home_page_popularity.save
      everyday_popularity = Popularity.where(:article_id => 1).first
      everyday_popularity.popularity += 1
      everyday_popularity.save
      cookies[:user_ip] = { :value => "#{request.remote_ip}", :expires => @expire_time }
    end
    @popularity = Popularity.where(:article_id => 0).first.popularity
    Rails.logger.info("#{@popularity}")
  end

  def show
    Rails.logger.info("============#{params[:title]}")
    @article = Article.find_by_title(params[:id])

    if Rails.env.production?
      @similar_articles = Article.where.not(title:params[:id]).where(category_id:@article.category_id).order("RAND()").limit(2);
    else
      @similar_articles = Article.where.not(title:params[:id]).where(category_id:@article.category_id).order("RANDOM()").limit(2);
    end
  end

  def search
    @search = params[:search]
    @articles = Article.all.where("title LIKE ?","%#{@search}%")
    @page = params[:page].present? ? params[:page] : 1
    @page = @page.to_i
    Rails.logger.info("========page#{@page}")
    @articles_per_page = 4
    @all_pages = (@articles.size.to_f / @articles_per_page).ceil
    @articles = @articles.all.order("id DESC").limit(@articles_per_page).offset(@articles_per_page * @page - 4)
    render 'blogs/search'
  end

  def about
    render :layout => 'about'
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
