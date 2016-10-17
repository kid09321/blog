class Asset
  attr_accessor :file_path, :file_name, :url

  def initialize(file_path,file_name,url = nil)
    @file_path = file_path
    @file_name = file_name
    @url = if url
              url
           else
             extensions = file_name.split('.')[1] # 副檔名
             if !extensions.blank? && %W(jpg gif png jpeg).include?(extensions)
               "/assets/#{file_name}"
             end
           end
  end

  def self.create(file_path,file = nil)
    # file_path = safe(file_path)
    file_dir,file_name = file_path.split('/',2) # ex:'assets/img.jpg'
    path = File.join(Rails.root, file_dir, file_name)
    if Rails.env.production?
      path  = File.join('/home/sen/blog/shared',file_dir, file_name)
    end
    if file
      Rails.logger.info("==========#{path}")
      File.open(path,'wb'){ |f| f.write(file) }
    else
      FileUtils.touch path
    end
    self.new(file_path, file_name)
  end
end
