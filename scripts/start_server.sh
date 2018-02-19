#!/bin/bash
cd /var/www/ni_configserver
source ~/.bash_profile

# ディレクトリが存在しないとsockファイルが作れずpumaを起動出来ないので、なければsocketsディレクトリを作成する
if [ ! -e /var/www/ni_configserver/tmp/sockets ]; then
  mkdir /var/www/ni_configserver/tmp/sockets
fi

# ディレクトリが存在しないとpidファイルが作れずpumaを起動出来ないので、なければpidsディレクトリを作成する
if [ ! -e /var/www/ni_configserver/tmp/pids ]; then
  mkdir /var/www/ni_configserver/tmp/pids
fi

SECRET_KEY_BASE=$(bundle exec rake secret) RAILS_SERVE_STATIC_FILES=true RAILS_ENV=$(echo $RAILS_ENV) bundle exec puma
sudo service nginx restart
