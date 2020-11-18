class Server < ApplicationRecord
    belongs_to :country

    def region
        self.country.region
    end
end
