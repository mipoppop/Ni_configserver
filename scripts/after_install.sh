#!/bin/bash
cd /var/www/ni_configserver
source ~/.bash_profile
RAILS_ENV=$(echo $RAILS_ENV) bundle install --path vendor/bundle
RAILS_ENV=$(echo $RAILS_ENV) bundle exec rake db:migrate
RAILS_ENV=$(echo $RAILS_ENV) bundle exec rake assets:precompile