module Instagram
  class InstagramPosts
    def initialize(user_id, access_token)
      @user_id = user_id
      @access_token = access_token
    end

    def get_posts
      Rails.logger.info("=======user_id:#{@user_id}")
      Rails.logger.info("=======access_token:#{@access_token}")
      uri = URI.encode("https://api.instagram.com/v1/users/#{@user_id}/media/recent/?access_token=#{@access_token}")
      uri = URI.parse(uri)
      response = Net::HTTP.get(uri)
      # all_posts = response[:data]
    end
  end
end
