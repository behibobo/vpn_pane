class Server < ApplicationRecord
    belongs_to :country
    has_many :connections, dependent: :destroy
    
    def region
        self.country.region
    end
end
