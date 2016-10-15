class Admin::BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_s3_bucket
  layout 'admin'

  def index
  end

  private

  def set_s3_bucket
    @s3_post = S3_BUCKET.presigned_post(key: "sliders/#{SecureRandom.uuid}/${filename}", success_action_status: '201',acl:'public-read')
  end
end
