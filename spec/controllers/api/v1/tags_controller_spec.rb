require 'spec_helper'

describe Api::V1::TagsController do
    before(:each){
    request.headers['Accept'] = "application/vnd.instahash.com+json; version=1"
  }

   describe "GET #create" do
    before(:each) do 
      get :create, format: :json, photo_id: "10150836244595317", tag:"#Alalala" 
    end

    it "responds with 201" do 
        expect(response.status).to eql 201
    end

    it "responds with JSON" do
      expect(response.content_type).to eql Mime::JSON.to_s
    end

    it "returns a tag object in json" do 
        tag_response = JSON.parse(response.body, symbolize_names: true)
        expect(tag_response[:tag]).to have_key(:photo_id)
      end

end

end

