class Article < ActiveRecord::Base
  belongs_to :user

  def first_image
    html = Nokogiri::HTML.fragment(self.content)
    all_image_tags = html.css('img').collect(&:to_s)
    first_image = all_image_tags.first
  end
end
