class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #Variables de ambiente globales, conienen el App ID y App Secret proporcionados por Facebook
  FACEBOOK_APP_ID = '1082951008399846'
  FACEBOOK_SECRET = '47deb9ece69fa080a90049a37fc83ea5'
  FACEBOOK_OAUTH_ACCESS_TOKEN = 'CAACEdEose0cBAHJyVODshWXO3lw3KytmHMR6O9b692oZBUa2BxIq3mdwZBol0pVBVCOFZA3k0RyRzEsHAnTxMSe552wYEO9H6x2UZCWZAidCXM9joxmhxKPerb4ZAZC382ZAvMcpphtsF9qA7jwZAYml0tq4cymOAMcgk62spfOVzecifdYlmaITBXT9uwXInZCbhF8VyZCxEHnBvZBmRnm06XeM6OUR1aCQmk8ZD'
  
end
