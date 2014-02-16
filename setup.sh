#!/bin/bash
echo "-----"
echo "Checking ruby version"
echo "-----"

ruby_version=`ruby -e 'print RUBY_VERSION'`

if [ "$ruby_version" != "1.9.3" ] 
then
    echo "You need ruby 1.9.3, you have $ruby_version"
    exit 1
fi

echo "-----"
echo "Installing project gems"
echo "-----"
gem install bundler
bundle install

echo "-----"
echo "Project ready"
echo "-----"