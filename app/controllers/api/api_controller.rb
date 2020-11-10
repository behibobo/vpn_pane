class Api::ApiController < ApplicationController
    def servers
        servers = Server.all
        render json: servers
    end
end
