class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article.create(params)
  end

  def show
    @article = Article.find_by_title(params[:id])
  end
end
