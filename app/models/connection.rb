class Connection < ApplicationRecord
  belongs_to :server
  belongs_to :account, optional: true
end
