class Api::ApiController < ApplicationController
    def servers
        regions = Country.select(:region).distinct
        data = []
        selected = Server.all.sample
        s = [{ country: "AutoConnect", ip: selected.ip, region: "", premium: true, username: selected.username, password: selected.password }]

        data.push(
                    {
                        region: "",
                        servers: s
                    })

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


    def connect
        con = Connection.new
        con.server_id = params[:server_id]
        con.account_id = params[:account_id]
        con.serial_number = params[:serial_number]
        con.ip = params[:ip]
        con.save!
        render json: true, status: 201
    end

    def disconnect
        con = Connection.find_by(serial_number: params[:serial_number])
        con.destroy unless con.nil?
        render json: true, status: 200
    end
end
