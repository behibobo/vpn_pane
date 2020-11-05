class Account < ApplicationRecord
  belongs_to :customer
  belongs_to :plan
  
  
  def due_date
    case Plan.intervals[self.plan.interval]
    when 0  
      return self.created_at + 1.month
    when 1
      return self.created_at + 3.month
    when 2
      return self.created_at + 6.month
    when 3
      return self.created_at + 12.month
    end
  end
end
