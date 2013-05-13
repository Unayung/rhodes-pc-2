# -*- encoding : utf-8 -*-
set :application, "rhodes-pc-2"
set :domain, "rhodes-pc.com"
set :repository, "git@github.com:Unayung/rhodes-pc.git" # your ssh way in github.
set :deploy_to, "/home/apps/rhodes-pc-2"
role :app, domain
role :web, domain
role :db, domain, :primary => true
set :deploy_via, :remote_cache
set :deploy_env, "production"
set :rails_env, "production"
set :scm, :git
set :branch, "master"
set :scm_verbose, true
set :use_sudo, false
set :user, "apps"
set :group, "apps"
default_environment["PATH"] = "/home/apps/.rvm/gems/ruby-1.9.3-p327/bin:/home/apps/.rvm/gems/ruby-1.9.3-p327@global/bin:/home/apps/.rvm/rubies/ruby-1.9.3-p327/bin:/home/apps/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
namespace :deploy do
  desc "restart"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end
# desc "Create database.yml and asset packages for production"
# after("deploy:update_code") do
#   db_config = "/home/apps/database.yml.production"
#   run "cp #{db_config} #{release_path}/config/database.yml"
# end
