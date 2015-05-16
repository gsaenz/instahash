require 'spec_helper'

describe Api::V1::AlbumsController do
	before(:each){
		request.headers['Accept'] = "application/vnd.instahash.com+json; version=1"
	}


	describe "GET #index" do
		before(:each) do 
			get :index, format: :json, user_id: "11111", access_token:"addddd" 
		end

		it "responds with 400 when user is unauthorized" do 
				expect(response.status).to eql 400
		end

		it "responds with JSON" do
			expect(response.content_type).to eql Mime::JSON.to_s
		end

	end
end
