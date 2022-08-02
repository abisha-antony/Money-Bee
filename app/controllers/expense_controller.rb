class ExpenseController < ApplicationController
    def create_new_expense
     expense = Expense.new(expense_params)

     if expense.save
        flash[:notice] = "Income Added Successfully !"
        redirect_to '/expense'
    else
        flash[:error] = "Failed! Try again later"
        redirect_to '/expense'
    end
    end
    

    private
    def expense_params
        params.require(:expense).permit(:category, :description, :amount)
    end

end
