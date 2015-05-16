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
				album = FbGraph2::Album.new(params[:album_id]).authenticate(params[:access_token]).fetch.photos
				photos = []
				album.each do |photo|
					if photo.name
						matches = (photo.name).scan(/\B#\w*[\u00F1A-Za-z_]+\w*/)
					else
						matches = []
					end
					tag = Api::V1::Tag.where(photo_id:photo.id)
					local_tags = []
					tag.each do |t|
						local_tags.push(t.tag)
					end
				   photos.push({:id => photo.id, :picture => photo.picture, :name => photo.name, :link => photo.link, :tags => matches, :local_tags => local_tags})
				end
				status_code = 200
				return {:data => photos, :status_code => status_code}
			rescue => ex
			   ex.message
			   status_code = 400
			   return {:data => ex.message, :status_code => status_code}
			end
		end



end
