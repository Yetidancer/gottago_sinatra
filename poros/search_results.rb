class SearchResults

  def clean_results(list, distance)
    clean(list, distance).to_json
  end

  private

  def clean(list, distance)
    results = list.find_all do |bathroom|
      bathroom[:distance] < distance.to_f
    end

    remove_extra_attributes(results)
  end

  def remove_extra_attributes(results)
    results.map do |bathroom|
      bathroom.slice(:id, :name, :street, :city, :state, :distance, :accessible, :unisex, :changing_table, :latitude, :longitude)
    end
  end
end
