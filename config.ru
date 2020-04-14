require 'rubygems'
require 'bundler'

Bundler.require

require './search'
run Sinatra::Application
