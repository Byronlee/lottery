require "faraday"
require "json"

set :notification_url, "https://oapi.dingtalk.com/robot/send?access_token=3b8a06c04cbf4030b6e42b9b93eeb74950f02e68aca04862c26bf4fc103961ce"

namespace :notification do
  task :started do
    deployer = `git config user.name`.chomp
    branch = `git branch | grep "*"`.chomp
    notity_dingding("#{deployer} is deploying #{fetch(:application)}:->#{branch}")
  end

  task :finished do
    deployer = `git config user.name`.chomp
    branch = `git branch | grep "*"`.chomp    
    notity_dingding("#{deployer} deployed #{fetch(:application)}:=> branch successfully")
  end
end

def notity_dingding(text)
  url = 'https://oapi.dingtalk.com/robot/send?access_token=3b8a06c04cbf4030b6e42b9b93eeb74950f02e68aca04862c26bf4fc103961ce'

  text = {
    'msgtype': 'text',  
    'text': {
        'content': text
    },
    'at': {
        'isAtAll': false
    }
  };  

  Faraday.post do |req|
    req.url url
    req.headers['Content-Type'] = 'application/json'
    req.body = JSON.generate(text)
  end      
end

namespace :deploy do
  before 'deploy',   'notification:started'
  after  'finished', 'notification:finished'
end
