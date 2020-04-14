require 'rubygems'
require 'bundler'

Bundler.require

require_relative 'sinatra_service/search.ru'
run Search
