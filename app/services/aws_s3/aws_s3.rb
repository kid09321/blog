module AwsS3
  class AwsS3
    def initialize(aws_key,aws_secret_key)
      @aws_key = aws_key
      @aws_secret_key = aws_secret_key
    end

    def upload
      s3 = Aws::S3::Resource.new(
        credentials: Aws::Credentials.new(ENV["AWS_ACCESS_KEY_ID"], ENV['AWS_SECRET_ACCESS_KEY']),
        region: 'ap-northeast-1'
      )

      obj = s3.bucket('zhezheblog').object("#{file_name}")
      obj.upload_file('/sliders', acl:'public-read')
      obj.public_url
    end
  end
end
