# frozen_string_literal: true

lock "~> 3.11.0"
set :application, "prowadzacy_roku"
set :repo_url, "https://github.com/Quintasan/prowadzacy_roku"
set :deploy_to, "/home/deploy/prowadzacy_roku"
append :linked_files, "config/database.yml", "config/secrets.yml", "config/master.key"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"
