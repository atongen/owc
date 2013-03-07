set  :rails_env, 'production'
set  :deploy_to, '/var/www/owc'
role :web, :app, :db, '216.243.151.114', :primary => true

