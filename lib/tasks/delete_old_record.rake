namespace :delete do
  desc 'destroy popularity after 30 days'
  task :old_record => :environment do
    #找到31天前的當日(article_id:1)人氣,刪除
    Popularity.where('created_at < ? AND article_id = ?',31.days.ago,1).delete_all
  end
end
