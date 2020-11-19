class AccountSerializer < ActiveModel::Serializer
  attributes :id, :plan, :customer, :remaing_days

  def plan
    object.plan.name
  end

  def customer
    object.customer.email
  end

  def remaing_days
    (object.due_date.to_date - Date.today).to_i
  end
end
