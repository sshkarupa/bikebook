set :scm, :git
set :repo_url, 'git@github.com:hrumhrumble/bikebook.git'

set :user, "deploy"
set :use_sudo, false
set :rvm_type, :user
set :keep_releases, 5

set :linked_files, %w{config/application.yml config/secrets.yml config/unicorn.rb config/database.yml}
set :linked_dirs, %w{log tmp vendor/bundle public/assets public/system}

namespace :figaro do
  desc "SCP transfer figaro configuration to the shared folder"
  task :setup do
    on roles(:app) do
      upload! "config/application.yml", "#{shared_path}/config/application.yml", via: :scp
    end
  end

  desc "Symlink application.yml to the release path"
  task :symlink do
    on roles(:app) do
      execute "ln -sf #{shared_path}/application.yml #{current_path}/config/application.yml"
    end
  end
end

after "deploy:started", "figaro:setup"
after "deploy:symlink:release", "figaro:symlink"
after 'deploy:publishing', 'deploy:restart'
after 'deploy:restart', 'unicorn:duplicate'
