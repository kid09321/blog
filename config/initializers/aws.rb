S3_BUCKET = Aws::S3::Resource.new(
        credentials: Aws::Credentials.new(Rails.application.secrets["AWS_ACCESS_KEY_ID"], Rails.application.secrets['AWS_SECRET_ACCESS_KEY']),
        region: 'ap-northeast-1'
      ).bucket('zhezheblog')
