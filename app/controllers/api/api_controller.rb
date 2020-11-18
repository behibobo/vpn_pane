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
end
