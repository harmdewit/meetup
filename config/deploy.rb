# $:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
set :default_environment, {
  'PATH' => "/home/harmdewit/.rbenv/shims:/home/harmdewit/.rbenv/bin:$PATH"
}

# Indien u geen RVM gebruikt op uw system kunt u het onderstaande bestand
# downloaden op: https://github.com/wayneeseguin/rvm/blob/master/lib/rvm/capistrano.rb
# Plaats dit in uw applicatie en pas de onderstaande require regel aan.
# require 'rvm/capistrano'

# De te gebruiken RVM versie, default is 1.8.7. Indien u een Thin installatie
# met Ruby 1.9.2 heeft dan kunt u '1.9.2' als versie opgeven.
# set :rvm_ruby_string, 'default'
# set :rvm_type, :system
# set :rvm_bin_path, '/usr/local/bin'

require "bundler/capistrano"

set :application, "meetup"
set :host,        "harmdewit.com"
set :user,        "harmdewit"
set :use_sudo,    false
set :deploy_to,   "~/www/meetup"
set :rake,        "/opt/ruby/bin/rake"
set :keep_releases, 3
set :bundle_without,  [:development, :test]
set :bundle_dir, File.join(fetch(:shared_path), 'vendor_bundle')

# Add RVM's lib directory to the load path.


set :scm,         :git
set :repository,  "git@harmdewit.com:meetup.git" 
ssh_options[:forward_agent] = true

role :app, host
role :web, host
role :db,  host, :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  after "deploy:update_code", :share_images
end

desc "Share the images between versions"
task :share_images do
  run "if [ -d #{deploy_to}/shared/images ]; then rm -r #{deploy_to}/shared/images; fi"
  run "mv -u #{release_path}/public/images #{deploy_to}/shared/images" # Using the same source and target directory name gives a "cannot move into subdirectory" conflict.
  run "ln -nfs #{deploy_to}/shared/images #{release_path}/public/images"
  
end

