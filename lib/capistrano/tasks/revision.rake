namespace :revision do

  desc 'Copy revision file'
  task :copy do
    on roles(:app) do |host|
      execute 'cp', '-a', '-f', "#{deploy_to}/revisions.log", "#{deploy_to}/current/"
    end
  end

  desc 'Download revision file'
  task :download do
    on roles(:app) do |host|
      download! "#{deploy_to}/revisions.log", 'revisions.log'
    end
  end

end
