class Category < ActiveRecord::Base

  has_many :articles

  def articles_count
    if self.try(:articles)
      self.try(:articles).size
    else
      0
    end
  end

  def latest_article
    if self.articles.last
      self.articles.last.updated_at.strftime("%Y-%m-%d")
    end
  end
end
