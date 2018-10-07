require 'find'

namespace :webpack do
  task :compile do
    on :local do
      puts 'compile client assets...'
      `cd ../client && npm run build && cd -`
    end
  end

  task :publish do
    on roles(:app) do
      puts 'publish client assets to server'
      Find.find("public").each do |filename|
        if File.file?(filename) && !/asset/.match(filename)
          p '上传 file：' + filename
          upload! filename, "#{release_path}/#{filename}" 
        end
      end
    end
  end
end

namespace :deploy do
  before 'deploy:compile_assets', 'webpack:compile'
  before 'deploy:compile_assets', 'webpack:publish'
end
