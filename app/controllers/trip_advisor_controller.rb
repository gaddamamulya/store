require 'rest-client'
class Review
	def self.get_reviews
	    response = RestClient.get('http://api.tripadvisor.com/api/partner/2.0/location/89575?key=7B762F84EAFA41BC844049C2EAC41AE7')
	    result = JSON.parse(response.body)
	    result["reviews"].each do |r|
	    	Review.create!("id" => r["id"], "rating" => r["rating"], "url" => r["url"])
	    end	
    end
end
