require 'rubygems'
require 'bundler'

Bundler.require

require './sinatra_service/search'
run Search
