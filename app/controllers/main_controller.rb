class MainController < ApplicationController
    def create_income
        if session[:user].nil?
            flash[:error] = "login to add Income"
        else
            income = Income.new(income_params)
            if income.save
                flash[:notice] = "Income Added Successfully !"
                redirect_to '/income'
            else
                flash[:error] = "Failed! Try again later"
                redirect_to '/income'
            end
        end
    end

    private
    def income_params
    params.require(:income).permit(:users_id, :description, :amount)
    end
end
