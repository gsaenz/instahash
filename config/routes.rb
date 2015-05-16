
Rails.application.routes.draw do

 

  namespace :api, path: '/api' do
    api_version(:module => "V1", :header => {:name => "Accept",
                                             :value => "application/vnd.instahash.com+json; version=1"},
                                             :defaults => {:format => :json},
                                             :default => true) do
         resources :albums, except: [:new,:edit]
         resources :photos, except: [:new,:edit]
         post "tags/create"    => "tags#create"
         delete "tags/destroy"    => "tags#destroy"
    end
  end
end
