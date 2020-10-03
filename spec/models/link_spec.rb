require "./spec/rails_helper.rb"
RSpec.describe Link do
	it "valid if it has a original url and lookup code " do
		link = Link.new(
			original_url: "https://www.geeksforgeeks.org/itertools-combinations-module-python-print-possible-combinations/",
			lookup_code: "1234567"
			)
		expect(link.valid?).to eq(true)
	end	


	it "invalid if original url is not formatted properly" do
		link = Link.new(
			original_url: "2w3ref",
			lookup_code: "1234567"
			)
		expect(link.valid?).to eq(false)
	end	


	it "invalid if it has a original url and lookup code " do
		link = Link.new(
			original_url: "https://www.geeksforgeeks.org/itertools-combinations-module-python-print-possible-combinations/",
			)
		expect(link.valid?).to eq(false)
	end	

	it "invalid if lookup_code is alreay present" do
		link = Link.new(
			original_url: "https://www.geeksforgeeks.org/itertools-combinations-module-python-print-possible-combinations/",
			lookup_code: "1234567"
			)

		link.save
		link1 = link = Link.new(
			original_url: "https://www.geeksforgeeks.org/itertools-combinations-module-python-print-possible-combinations/",
			lookup_code: "1234567"
			)
		expect(link.valid?).to eq(false)

	end
end
