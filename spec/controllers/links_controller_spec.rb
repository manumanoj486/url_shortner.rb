require "./spec/rails_helper.rb"
RSpec.describe LinksController, type: :controller do
	 it "can shorten the link provided by the user" do
	 	request.env["HTTP_ACCEPCT"] = "text/javascript"
	 	url = "https://www.geeksforgeeks.org/itertools-combinations-module-python-print-possible-combinations/"
	 	post :create, params: { link: { original_url: url}}
	 	link = assigns(:link)
	 	expect(link.original_url).to eq(url)
	 	expect(link.lookup_code.length).to eq(7)
	 	expect(response).to render_template("create")

	 end	

end	