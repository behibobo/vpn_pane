class Admin::DashboardController < AdminController
    def index
        # uri = URI.parse("https://restcountries.eu/rest/v2/all")

        # response = Net::HTTP.get_response(uri)
        # hash = JSON.parse(response.body)
        # Country.destroy_all
        # hash.each do |c|
        #     Country.create(name: c["name"], region: c["region"], code: c["alpha2Code"])
        # end

        plans = Plan.order(:interval)
        @data = []
        plans.each do |plan|
            item = {
                plan: plan.name,
                count: Account.where(plan: plan).count
            }

            @data.push(item)
        end

        @latest = Account.order(created_at: :desc).first(10)
        @last_days = Account.group_by_day(:created_at).count
        @customers_count = Customer.count
        @accounts_count = Account.count
    end
end