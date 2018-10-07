set :deploy_to, "/home/app/choujing"
# server 'app@139.198.16.79:20222', roles: %w[web app db], primary: true
server 'app@blocktrending.com:40222', roles: %w[web app db], primary: true
# set :repo_tree, 'server'

if ENV['PROXY'].present?
  bundle_env_variables[:http_proxy] = bundle_env_variables[:https_proxy] = ENV['PROXY']
end



