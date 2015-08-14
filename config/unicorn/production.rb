rails_env = ENV['RAILS_ENV'] || 'production'

deploy_to = "/home/deploy/www/bikebook"
rails_root = "#{deploy_to}/current"
pid_file = "#{deploy_to}/shared/tmp/pids/unicorn.pid"
socket_file= "#{deploy_to}/shared/sockets/unicorn.sock"
log_file = "#{deploy_to}/shared/log/unicorn.log"
err_log_file = "#{deploy_to}/shared/log/unicorn.error.log"

old_pid_file = pid_file + '.oldbin'

worker_processes 1
working_directory rails_root

timeout 120

# Specify path to socket unicorn listens to,
# we will use this in our nginx.conf later

listen socket_file, backlog: 64
# listen "127.0.0.1:16018"

# Set process id path
pid pid_file

# Set log file paths
stderr_path err_log_file
stdout_path log_file

# http://tech.tulentsev.com/2012/03/deploying-with-sinatra-capistrano-unicorn/
# NOTE: http://unicorn.bogomips.org/SIGNALS.html
preload_app true

# make sure that Bundler finds the Gemfile
before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = File.join( rails_root, 'Gemfile' )
end

before_fork do |server, worker|
  # при использовании preload_app = true здесь должно быть закрытие всех открытых сокетов

  # Mongoid сам заботится о переконнекте
  # http://two.mongoid.org/docs/upgrading.html

  # http://stackoverflow.com/a/9498372/2041969
  # убиваем параллельный старый-процесс просле старта нового
  if File.exists?( old_pid_file )
    begin
      Process.kill( "QUIT", File.read( old_pid_file ).to_i )
    rescue Errno::ENOENT, Errno::ESRCH
      puts "Old master alerady dead"
    end
  end
end

after_fork do |server, worker|
  # pid-ы дочерних процессов
  child_pid_file = server.config[:pid].sub( '.pid', ".#{worker.nr}.pid" )
  system( "echo #{Process.pid} > #{child_pid_file}" )
end

