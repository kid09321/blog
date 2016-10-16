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
    current_user.admin
  end

end
