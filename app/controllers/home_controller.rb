class HomeController < ApplicationController
    def index
        @plans = Plan.order(:interval)
    end
end
