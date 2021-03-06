# config valid only for current version of Capistrano
lock '3.6.1'

# 你的 application name
set :application, 'blog'


# 你的 git url
set :repo_url, 'https://github.com/kid09321/blog.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# deploy 的資料夾位置 (prodution)
set :deploy_to, "/home/sen/blog"
# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true


# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# git clone 完成後會從 shared 資料夾 copy 過去的檔案
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# git clone 完成後會從 shared 資料夾 copy 過去的資料夾
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads/sliders', 'public/uploads/ckeditor')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
set :shared_paths, fetch(:shared_paths,[]).push('public_uploads')
