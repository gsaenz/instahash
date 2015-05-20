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
				user = Api::V1::Fb.new().getUser(params[:user_id], params[:access_token])
				status_code = 200
				return {:data => user, :status_code => status_code}
			rescue => ex
			   ex.message
			   status_code = 400
			   return {:data => ex.message, :status_code => status_code}
			end
		end

end
