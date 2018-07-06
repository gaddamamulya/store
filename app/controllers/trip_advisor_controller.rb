class TripAdvisorController < ApplicationController
	def get_reviews
		p "===================="
	    response = RestClient.get('http://api.tripadvisor.com/api/partner/2.0/location/89575?key=7B762F84EAFA41BC844049C2EAC41AE7')
	    result = JSON.parse(response.body)
	    result["reviews"].each do |r|
	    	p = Product.new
	    	p.reviews.new("id" => r["id"], "rating" => r["rating"], "url" => r["url"])
	    	p.save!
	    end	
	    render :json => result
    end
end
