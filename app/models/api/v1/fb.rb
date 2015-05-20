class Api::V1::Fb  < ActiveRecord::Base


	def getUser(user_id, access_token)
		user = FbGraph2::User.new(user_id).authenticate(access_token)
		user.fetch
		return user
	end

	def getPhotos(album_id, access_token)
		album = FbGraph2::Album.new(album_id).authenticate(access_token).fetch.photos
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
		 photos.push({:id => photo.id, :picture => photo.picture, :name => photo.name, :link => photo.link, :tags => matches, :local_tags => local_tags}) #cambiarlo a una clase
		end
		return photos
	end

end