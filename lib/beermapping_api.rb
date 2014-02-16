class BeermappingApi
	def self.places_in(city)
		url = "http://beermapping.com/webservice/loccity/#{key}/"

		response = HTTParty.get "#{url}#{ERB::Util.url_encode(city)}"
		places = response.parsed_response["bmp_locations"]["location"]
		
		return [] if places.is_a?(Hash) and places['id'].nil?

		places = [places] if places.is_a?(Hash)
		places = places.inject([]) do |set, place|
			set << Place.new(place)
		end
	end

	def self.key
		"6dc19e84f1c1fea78cc24963dcb85b41"
	end
end
