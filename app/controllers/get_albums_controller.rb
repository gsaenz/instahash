class GetAlbumsController < ApplicationController
    
    def home
        # Se obtiene permiso del usuario solicitando su ACCES_TOKEN obtener datos
        
        #auth = FbGraph2::Auth.new('1082951008399846', '47deb9ece69fa080a90049a37fc83ea5')
        #signed_request = auth.from_cookie cookies
        #signed_request.access_token   
        

        # Una vez autenticado, obtenemos un objeto usuario para navegar en su información
        
        #user = FbGraph2::User.new(usedId).authenticate(accessToken)
        # "user.fetch" regresa una instancia FbGraph::User que contiene attributes y edges tipo facebook
        user.fetch
        
        # Los attributes y edges se regresan como objetos ruby
        # Ejemplo:      user.name     # => String
        #               user.email    # => String

    end
end
