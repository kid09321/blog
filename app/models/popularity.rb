class Popularity < ActiveRecord::Base

  def self.past_7_days_popularities
    total_count = 0
    @today = Date.today
    @popularities = Popularity.where(article_id:1,created_at: 7.days.ago..@today.end_of_day).all
    @popularities.each  do |popularity|
      total_count += popularity.popularity
    end
    total_count
  end

end
