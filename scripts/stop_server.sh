#!/bin/bash
cd /var/www/ni_configserver

source ~/.bash_profile

sudo service nginx stop
bundle exec pumactl halt
