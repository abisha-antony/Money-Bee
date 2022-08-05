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

    def debt_recorder
        if session[:user].nil?
            flash[:error] = "login to add debt"
        else
            debt = DebtRecorder.new(debt_params)
            if debt.save
                flash[:notice] = "Debt added successfully !"
                redirect_to '/debt_recorder'
            end
        end
    end

    
    def delete_income       
       @dlt_id = Income.find(params[:id])
       if @dlt_id.destroy
        redirect_to "/income"
       end
    end

    def update_income
        @update = Income.find(i_update_params[:id])
        if @update.update(i_update_params)
            redirect_to "/income"
        end
    end

    def create_expense
        if session[:user].nil?
            flash[:error] = "login to add Income"
        else
            expense = Expense.new(expense_params)
            if expense.save
                flash[:notice] = "Income Added Successfully !"
                redirect_to '/expense'
            else
                flash[:error] = "Failed! Try again later"
                redirect_to '/expense'
            end
        end

    end
    def delete_expense
        @inc_dlt = Expense.find(params[:ed])
        if @inc_dlt.destroy
        redirect_to "/expense"
        end
    end
    def update_expense
        @inc_upd = Expense.find(e_update_params[:id])
        if @inc_upd.update(e_update_params)
        redirect_to "/expense"
        end
    end

    private
    def income_params
        params.require(:income).permit( :description, :amount, :users_id)
    end
    def i_update_params
        params.require(:income).permit(:id, :description, :amount)
    end
    def debt_params
        params.require(:debt_recorders).permit(:date,:owed_to,:amount,:description)
    end
    def expense_params
        params.require(:expense).permit(:category, :description, :amount)
    end
    def e_update_params
        params.require(:expense).permit(:id, :category, :description, :amount)
    end
end
