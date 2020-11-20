class Api::ApiController < ApplicationController
    def servers
        regions = Country.select(:region).distinct
        data = []
        regions.each do |r|
            servers = Server.joins(:country).where(countries: { region: r.region })
            if servers.any? 
                data.push(
                    {
                        region: r.region,
                        servers: ActiveModel::SerializableResource.new(servers)
                    })
            end
        end

        render json: data.to_json
    end


    def auth
        if params[:token]
            acc = Account.find_by(acc_id: params[:token])
            if acc.nil?
                render json: false, status: 401
                return
            end
            render json:acc
            return
        else
            render json: false, status: 401
            return
        end
    end
end
