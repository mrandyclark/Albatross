load 'deploy/assets'
require "bundler/capistrano"

set :application, "albatross"

default_run_options[:pty] = true
set :use_sudo, false
set :scm, :git

set :rails_env, "production"
set :deploy_to, "/mnt/data/#{application}"

set :repository, "git@github.com:mrandyclark/Albatross.git"
set :branch, "master"
set :ssh_options, { :forward_agent => true }

set :user, "powerintheup"
set :location, "23.23.235.31"
ssh_options[:keys] = [File.join(ENV["AWS_HOME"], "powerintheup.pem")]

role :app, location
role :web, location
role :db, location, :primary => true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
end