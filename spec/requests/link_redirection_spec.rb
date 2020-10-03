require 'rails_helper'

RSpec.describe "Link Redirection" , type: :request do 
	it "it will redirects to original link given shortend link" do
		url = "https://edgeguides.rubyonrails.org/active_record_validations.html"
		shortner = Shortner.new(url)
		link = shortner.generate_short_link
		get link.shorted_url
		expect(response).to redirect_to(link.original_url)

	end
end	