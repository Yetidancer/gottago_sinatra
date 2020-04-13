require 'sinatra'
require 'faraday'
require 'pry'
require_relative 'restrooms_service'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/search' do
        number_of_results = params['number_of_results']
        latitude = params['latitude'].to_f
        longitude = params['longitude'].to_f
        distance = params['distance']

        RefugeRestroomsService.new.search_bathrooms(number_of_results, latitude, longitude, distance)
      end
    end
  end
  
end
