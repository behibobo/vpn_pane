# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

uri = URI.parse("https://restcountries.eu/rest/v2/all")

        response = Net::HTTP.get_response(uri)
        hash = JSON.parse(response.body)
        Country.destroy_all
        hash.each do |c|
            Country.create(name: c["name"], region: c["region"], code: c["alpha2Code"])
        end

Plan.create(name: "1month", interval: 0, price: 12.00)
Plan.create(name: "3month", interval: 1, price: 24.00)
Plan.create(name: "6month", interval: 2, price: 36.00)
Plan.create(name: "12month", interval: 3, price: 75.00)

100.times do
    customer = Customer.create(
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.cell_phone
    )


    Account.create(
        customer: customer,
        plan: Plan.all.sample,
        created_at: Date.today + (2..30).to_a.sample,
        acc_id: SecureRandom.uuid,
    )
end


30.times do
    Server.create!(
        username: "behzad",
        password: "1234@qwerB",
        ip: "vpn.nessom.ir",
        premium: [true,false].sample,
        country: Country.all.sample
    )
end