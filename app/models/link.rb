class Link < ApplicationRecord
	validates :original_url, :lookup_code, presence: true
	validate :validate_originl_url	
	validates :lookup_code, uniqueness: true

	def validate_originl_url
		uri = URI.parse(original_url || "")
		if uri and uri.host.nil?
			errors.add(:original_url, "Invalid Format")
		end	

	end	


	def shorted_url
		"#{AppConstants.base_url}/#{self.lookup_code}"
	end	

end
