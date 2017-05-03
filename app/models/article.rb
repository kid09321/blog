class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :popularities

  def first_image
    html = Nokogiri::HTML.fragment(self.content)
    all_image_tags = html.css('img').collect(&:to_s)
    first_image = all_image_tags.first
  end

  def first_image_link
    html = Nokogiri::HTML.fragment(self.content)
    first_image = html.css('img').first
    if first_image
      first_image['src']
    else
      nil
    end
  end

  def only_words
    ActionController::Base.helpers.strip_tags(self.content)
  end
end
