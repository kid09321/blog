class BlogsController < ApplicationController
  def index
    @instagram_posts = Instagram::InstagramPosts.new('self','635574010.1677ed0.cdd432f04d92473cac4e6927dd47bfde
').get_posts
    @posts = JSON.parse(@instagram_posts)['data']
  end

  def about
  end
end
