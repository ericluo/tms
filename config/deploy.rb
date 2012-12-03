require 'bundler/vlad'

set :application, "sms"
set :domain, "192.168.1.123"
set :sudo_password, "snow327"
set :deploy_to, "/home/eric/workspace/sms"
set :repository, 'https://github.com/ericluo/tms.git'
set :revision, "origin/sti"

desc "Full deployment cycle"
task "vlad:deploy" => %w[
  vlad:update
  vlad:bundle:install
  vlad:migrate
  vlad:start
  vlad:cleanup
]
