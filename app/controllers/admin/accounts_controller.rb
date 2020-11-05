class Admin::AccountsController < AdminController
    def index
        @q = Account.ransack(params[:q])
        @accounts = @q.result(distinct: true).paginate(page: params[:page])
    end
end