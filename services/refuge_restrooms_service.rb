require './poros/search_results'

class RefugeRestroomsService
  def search_bathrooms(number_of_results, latitude, longitude, distance)
    list = get_search_json(number_of_results, latitude, longitude)

    SearchResults.new.clean_results(list, distance)
  end

  def return_bathrooms(page)
    list = get_all_json(page)

    SearchResults.new.remove_extra_attributes(list)
  end

  private

  def get_search_json(number_of_results, latitude, longitude)
    response = conn.get("/api/v1/restrooms/by_location?page=1&per_page=#{number_of_results}&offset=0&ada=false&unisex=false&lat=#{latitude}&lng=#{longitude}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_all_json(page)
    response = conn.get("/api/v1/restrooms?page=#{page}&per_page=100&offset=0")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://www.refugerestrooms.org')
  end
end
