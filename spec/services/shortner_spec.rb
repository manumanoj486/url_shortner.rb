
require "./spec/rails_helper.rb"
RSpec.describe Shortner do
	it "shortens a url to 7 charecter lookup code" do
		url = "https://stackoverflow.com/questions/3724487/rails-root-directory-path"
		shortner = Shortner.new(url)
		expect(shortner.lookup_code.length).to eq(7)
	end

	it "gives own urls lookup code" do
		url = "https://stackoverflow.com/questions/3724487/rails-root-directory-path"
		shortner = Shortner.new(url)
		code_1 = shortner.lookup_code

		url = "https://stackoverflow.com/questions/3724487/rails-root-directory-poll"
		shortner = Shortner.new(url)
		code_2 = shortner.lookup_code

		expect(code_1).not_to eq(code_2)

	end	

	it "generates a shortner link" do
		url = "https://stackoverflow.com/questions/3724487/rails-root-directory-path"
		shortner = Shortner.new(url)
		link = shortner.generate_short_link
		expect(link.valid?).to eq(true)
	end	


end	