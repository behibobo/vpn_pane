# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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


