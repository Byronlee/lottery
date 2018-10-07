require "active_support/all"

#set :scm, :git
set :application, 'blocktrending'
set :repo_url, "https://github.com/NoonTechnology/BlockTrending.git"

set :sidekiq_role, [:db, filter: :sidekiq, properties: {}]

fetch(:linked_files).concat %w[
  config/settings.local.rb
  config/database.yml
  config/elasticsearch.yml
  config/secrets.yml
  config/redis.yml
  tmp/restart.txt
]

fetch(:linked_dirs).concat %w[
  public/uploads
  app/assets/bundles
  vendor/node_modules
  public/downloads
  public/static/css
  public/static/js
  public/static/media
]

set :bundle_flags, ""

namespace :deploy do
  desc "rake db:seed"
  task :seed do
    on primary(:db) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:seed"
        end
      end
    end
  end
  after "deploy:migrate", "deploy:seed"
end

load "config/deploy/recipes/webpack.rb"
load "config/deploy/recipes/notification.rb"

