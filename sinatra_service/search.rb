require 'sinatra'
require 'faraday'
require 'pry'
require './services/refuge_restrooms_service'

class Search < Sinatra::Application
  get '/api/v1/search' do
    number_of_results = params['number_of_results']
    latitude = params['latitude'].to_f
    longitude = params['longitude'].to_f
    distance = params['distance']

    RefugeRestroomsService.new.search_bathrooms(number_of_results, latitude, longitude, distance)
  end
end

run Search.run!
