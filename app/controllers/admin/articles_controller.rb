class Admin::ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin?
  layout 'admin'
  def new
    @article = current_user.articles.build
  end

  def index
    @articles = Article.all
  end

  def create
    @article = current_user.articles.build(article_params)
    @article.save
    redirect_to '/admin/articles'
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to '/admin/articles'
  end
  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def admin?
    if !current_user.admin
      redirect_to blogs_path
    end
  end
end
