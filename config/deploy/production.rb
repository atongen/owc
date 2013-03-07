set  :rails_env, 'production'
set  :deploy_to, '/var/www/owc'
role :web, '216.243.151.114'
role :app, '216.243.151.114'
role :db,  '216.243.151.114', :primary => true

