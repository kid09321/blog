class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :build_everyday_popularity_data

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end

  def build_everyday_popularity_data
    @today = Date.today
    @every_popularity = Popularity.where(:article_id => 1,:created_at => (@today.beginning_of_day..@today.end_of_day)).first
    if !@every_popularity
      @popularity = Popularity.new(article_id: 1, popularity: 0)
      @popularity.save
    end
  end
end
