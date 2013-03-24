# setup the deployment stages
set :stages, %w{ staging production }
set :default_stage, 'production'
require 'capistrano/ext/multistage'
require "bundler/capistrano"

set :application, "owc"

# git
set :scm, "git"
set :repository, "git://github.com/atongen/owc.git"

set :deploy_via, :remote_cache
set :keep_releases, 5
set :user, "deploy"

default_run_options[:pty]   = true
ssh_options[:forward_agent] = true
default_run_options[:shell] = '/bin/bash'
set :ruby_version, "ruby-1.9.3-p392"
set :chruby_config, "/etc/profile.d/chruby.sh"
set :set_ruby_cmd, "source #{chruby_config} && chruby #{ruby_version}"
set(:bundle_cmd) {
  "#{set_ruby_cmd} && exec bundle"
}

namespace :owc do
  desc 'Update the symlinks'
  task :create_symlink, :roles => :app do
    [
      "config/database.yml",
      "config/application.yml",
      "tmp/sessions",
      "tmp/sockets",
      "tmp/assets",
      "storage",
      "bak"
    ].each do |path|
      run <<-CMD
        ln -s #{shared_path}/#{path} #{latest_release}/#{path}
      CMD
    end
  end

  desc 'Set application ownership for passenger'
  task :app_own, :roles => :app do
    puts "Deploy user sudo password"
    run "#{try_sudo} chown #{application}:#{application} #{latest_release}/config/environment.rb"
    run "#{try_sudo} chown #{application}:#{application} #{latest_release}/config.ru"
  end

  desc 'Fix perms'
  task :fix_perms, :roles => :app do
    %w{ assets cache dragonfly index }.each do |dir|
      run "[ -d \"#{latest_release}/tmp/#{dir}\" ] || #{try_sudo} mkdir -p \"#{latest_release}/tmp/#{dir}\""
      run "#{try_sudo} chown -R #{application}:#{user} \"#{latest_release}/tmp/#{dir}\""
      run "#{try_sudo} find \"#{latest_release}/tmp/#{dir}\" -type d -exec chmod -R 775 {} \\;"
      run "#{try_sudo} find \"#{latest_release}/tmp/#{dir}\" -type f -exec chmod -R 664 {} \\;"
    end
  end
end

# passenger override
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# hooks
before "deploy:assets:precompile", "owc:create_symlink"
before "deploy:assets:precompile", "owc:app_own"
before "deploy:assets:precompile", "owc:fix_perms"
after  "deploy:update",            "deploy:migrate"
after  "deploy:update",            "deploy:cleanup"
