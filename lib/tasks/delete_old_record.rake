namespace :delete do
  desc 'destroy everday popularity'
  task :old_record => :environment do
    Popularity.where(article_id:1).first.destroy
  end
end
