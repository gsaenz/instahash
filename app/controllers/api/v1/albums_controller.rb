class Api::V1::AlbumsController < Api::V1::BaseController

	def index
		fb_login = auth
		if fb_login[:status_code] == 200
			response = fb_login[:data].albums
		else
			response = fb_login[:data]
		end	
		respond_to do |format|
			format.json { render :json => response, status: fb_login[:status_code]}
		end
	end

	private
		def auth
			begin
				user = FbGraph2::User.new(params[:user_id]).authenticate(params[:access_token])
				user.fetch
				status_code = 200
				return {:data => user, :status_code => status_code}
			rescue => ex
			   ex.message
			   status_code = 400
			   return {:data => ex.message, :status_code => status_code}
			end
		end

end
