class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin?
  layout 'admin'

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to admin_categories_path
  end

  def show
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def admin?
    if !current_user.admin
      redirect_to blogs_path
    end
  end
end
