set :application, "sms"
set :domain, '192.168.1.123'
set :user, "eric"
set :repository,  "https://github.com/ericluo/tms.git"
set :deploy_to, "/home/eric/workspace/sms"

require "rvm/capistrano"
set :rvm_ruby_string, "1.9.3"

role :web, domain
role :app, domain
role :db,  domain, :primary => true # This is where Rails migrations will run

set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'sti'
set :scm_verbose, true
set :use_sudo, false
set :rails_env, :production

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
  end
end

after "deploy:update_code", :bundle_install
desc "install the necessary prerequisites"
task :bundle_install, :roles => :app do
  run "cd #{release_path} && bundle install"
end
