require "digest/sha2"
class Shortner
	attr_reader :url, :link_model
	def initialize(url, link_model = Link)
		@url = url
		@link_model = link_model
	end
	
	def generate_short_link
		link_model.create(original_url: url, lookup_code: lookup_code)
	end	

	def lookup_code
		loop do
			code = get_fresh_code	
			unless Link.exists?(lookup_code: code)
				return code
			end
		end	
	end	

	def get_fresh_code
		SecureRandom.uuid[0..6]
	end	

end	