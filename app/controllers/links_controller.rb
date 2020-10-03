class LinksController < ApplicationController
	def show
		link = Link.find_by(lookup_code: params[:lookup_code])
		p link.shorted_url
		redirect_to link.original_url
	end
		
	def create

		shortner = Shortner.new(link_params[:original_url])
		@link = shortner.generate_short_link	
		if @link.persisted?
			respond_to :js
		else
			render "error.js.erb"	
		end	
	end	



	def link_params
		params.require(:link).permit(:original_url)
	end	

end	