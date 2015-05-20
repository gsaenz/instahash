class Api::V1::PhotosController < Api::V1::BaseController


	def index
		response = photos
		respond_to do |format|
			format.json { render :json => response[:data], status: response[:status_code]}
		end
	end

	private
		def photos
			begin
				photos = Api::V1::Fb.new().getPhotos(params[:album_id], params[:access_token])
				status_code = 200
				return {:data => photos, :status_code => status_code}
			rescue => ex
			   ex.message
			   status_code = 400
			   return {:data => ex.message, :status_code => status_code}
			end
		end



end
