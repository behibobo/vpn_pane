class Admin::CustomersController < AdminController
    def index
        @q = Customer.ransack(params[:q])
        @customers = @q.result(distinct: true).paginate(page: params[:page])
    end

    def show
        @customer = Customer.find(params[:id])
    end
end