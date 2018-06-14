lock "~> 3.11.0"
set :application, "prowadzacy_roku"
set :repo_url, "https://github.com/Quintasan/prowadzacy_roku"
set :deploy_to, "/home/deploy/prowadzacy_roku"
append :linked_files, "config/database.yml", "config/secrets.yml", "config/master.key"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"

namespace :delayed_job do
  desc "Stop the delayed_job process"
  task :stop do
    on roles(:app) do
      run "cd #{current_path}; RAILS_ENV=production bin/delayed_job stop"
    end
  end

  desc "Start the delayed_job process"
  task :start do
    on roles(:app) do
      run "cd #{current_path}; RAILS_ENV=production bin/delayed_job start"
    end
  end

  desc "Restart the delayed_job process"
  task :restart do
    on roles(:app) do
      run "cd #{current_path}; RAILS_ENV=production bin/delayed_job restart"
    end
  end
end

after "deploy:starting", "delayed_job:stop"
after "deploy:finished", "delayed_job:start"
after "deploy:restart", "delayed_job:restart"
