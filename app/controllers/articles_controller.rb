class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article.create(params)
  end
end
