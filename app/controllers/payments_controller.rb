class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => [:payment_return]
    def payment_fail
    end


    def payment_return
        email, phone = params[:custom].split("|")
        cust = Customer.new
        cust.email = email
        cust.phone = phone
        cust.save

        plan = Plan.find_by(name: params[:item_name])
        @account = Account.create(plan: plan, customer: cust, acc_id: SecureRandom.uuid)
        @data = {
            payment_status: params[:payment_status],
            payment_gross: params[:payment_gross],
            mc_currency: params[:mc_currency]
        }
    end
end
