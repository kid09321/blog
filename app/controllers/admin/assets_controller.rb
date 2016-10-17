class Admin::AssetsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin?
  def upload
    qqfile = QqFile.new(params[:qqfile],request)
    image = qqfile.body
    asset = Asset.create params[:key],image
    render text: asset.to_json
  end

  def slider_link
    if @link = Link.where(link_type: link_params[:link_type]).first
      @link.update(link_params)
    else
      @link = Link.new(link_params)
      @link.save
    end
    render :nothing => true
  end

  private

  def admin?
    if !current_user.admin
      redirect_to blogs_path
    end
  end

  def link_params
    params.require(:link).permit(:title, :link_type, :url)
  end

end
