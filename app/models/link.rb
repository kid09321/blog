class Link < ActiveRecord::Base

  def link_title
    title = self.try(:title)
  end

  def link_url
    url = self.try(:url)
  end
end

