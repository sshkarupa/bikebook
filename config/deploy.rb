set :scm, :git
set :repo_url, 'git@github.com:hrumhrumble/bikebook.git'

set :use_sudo, false
set :rvm_type, :user
set :keep_releases, 5

set :linked_files, %w{config/application.yml config/secrets.yml config/unicorn.rb config/database.yml}
set :linked_dirs, %w{log tmp vendor/bundle public/assets public/system}

after 'deploy:publishing', 'deploy:restart'
after 'deploy:restart', 'unicorn:duplicate'
