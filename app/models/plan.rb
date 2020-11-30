class Plan < ApplicationRecord
    enum interval: ["monthly", "3month", "6month", "12month"]
    has_many :accounts
end
