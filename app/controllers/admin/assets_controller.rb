class Admin::AssetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_s3_bucket
  def upload
    qqfile = QqFile.new(params[:qqfile],request)
    image = qqfile.body
    asset = Asset.create params[:key],image
    render text: asset.to_json
  end

  private

  def set_s3_bucket
    @s3_post = S3_BUCKET.presigned_post(key: "sliders/#{SecureRandom.uuid}/${filename}", success_action_status: '201',acl:'public-read')
  end
end
