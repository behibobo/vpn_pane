class Server < ApplicationRecord
    belongs_to :country
    has_many :connections, dependent: :destroy
    
    def region
        self.country.region
    end

    def reping 
        response_time = `ping -c 1 #{self.ip} | tail -1| awk '{print $4}' | cut -d '/' -f 2`
        self.ping = response_time.to_i
        self.save
        return response_time.to_i
    end
end
