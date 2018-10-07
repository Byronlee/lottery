require "active_support/all"

#set :scm, :git
set :application, 'blocktrending'
set :repo_url, "https://github.com/Byronlee/lottery.git"

fetch(:linked_files).concat %w[
  config/settings.local.rb
  config/database.yml
  config/elasticsearch.yml
  config/secrets.yml
  config/redis.yml
  tmp/restart.txt
]

fetch(:linked_dirs).concat %w[
  app/assets/bundles
  vendor/node_modules
]