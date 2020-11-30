class AccountSerializer < ActiveModel::Serializer
  attributes :id, :plan, :customer, :remaining_days

  def plan
    object.plan.name
  end

  def customer
    object.customer.email
  end

  def remaining_days
    (object.due_date.to_date - Date.today).to_i
  end
end
