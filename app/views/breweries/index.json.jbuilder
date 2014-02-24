json.array!(@breweries) do |brewery|
	json.extract! brewery, :name, :year

	
	json.labelCount brewery.beers.count
	
end
