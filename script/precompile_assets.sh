#!/bin/bash

APP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
cd "$APP_HOME"
rm -Rf tmp/assets/* tmp/cache/* public/assets
bundle exec rake threads:js
if [ -z "$RAILS_ENV" ]; then
  RAILS_ENV=production
fi
RAILS_ENV=$RAILS_ENV bundle exec rake assets:precompile
touch tmp/restart.txt