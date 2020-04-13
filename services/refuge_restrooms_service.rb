require_relative 'search_results'

class RefugeRestroomsService


  def search_bathrooms(number_of_results, latitude, longitude, distance)
    list = get_json(number_of_results, latitude, longitude)

    SearchResults.new.clean_results(list, distance)
  end

  private

  def get_json(number_of_results, latitude, longitude)
    response = conn.get("/api/v1/restrooms/by_location?page=1&per_page=#{number_of_results}&offset=0&ada=false&unisex=false&lat=#{latitude}&lng=#{longitude}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://www.refugerestrooms.org')
  end
end
