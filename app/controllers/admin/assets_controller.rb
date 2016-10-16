class Admin::AssetsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin?
  def upload
    qqfile = QqFile.new(params[:qqfile],request)
    image = qqfile.body
    asset = Asset.create params[:key],image
    render text: asset.to_json
  end

  private

  def admin?
    if !current_user.admin
      redirect_to blogs_path
    end
  end

end
