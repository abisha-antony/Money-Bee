# frozen_string_literal: true

class MainController < ApplicationController
    def create_income
        if session[:user].nil?
            flash[:error] = "login to add Income"
        else
            main_bal = MainBalance.find_by(users_id: get_user_id)
            sum = params[:income][:amount].to_i + main_bal["amount"]
            main_bal.update(
                amount: sum,
            )
            main_bal.save
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
    cur_user = session[:user]
    if cur_user.nil?
      flash[:error] = 'login to add debt'
    else
      debt = DebtRecorder.new(debt_params)
      if debt.save
        PostMailer.with(to_email: cur_user['email'], name: cur_user['name'],
                        params: params[:debt_recorders]).debt_reminder.deliver_now
        flash[:notice] = 'Debt added successfully !'
        redirect_to '/debt_recorder'
      end
    end
  end

  def delete_income
    id = params[:id]
    @dlt_id = Income.find(id)
    redirect_to '/income' if @dlt_id.destroy
  end

  def update_income
    @update = Income.find(i_update_params[:id])
    redirect_to '/income' if @update.update(i_update_params)
  end

  def create_expense
    if session[:user].nil?
      flash[:error] = 'login to add Income'
    else
      main_bal = MainBalance.find_by(users_id: get_user_id)
      diff = main_bal['amount'] - params[:expense][:amount].to_i
      main_bal.update(
        amount: diff
      )
      main_bal.save
      expense = Expense.new(expense_params)
      if expense.save
        flash[:notice] = 'Income Added Successfully !'
      else
        flash[:error] = 'Failed! Try again later'
      end
      redirect_to '/expense'
    end
  end

  def delete_expense
    @inc_dlt = Expense.find(params[:ed])
    redirect_to '/expense' if @inc_dlt.destroy
  end

  def update_expense
    @inc_upd = Expense.find(e_update_params[:id])
    redirect_to '/expense' if @inc_upd.update(e_update_params)
  end

  def delete_debt
    id = params[:dd]
    @debt_dlt = DebtRecorder.find(id)
    redirect_to '/debt_recorder' if @debt_dlt.destroy
  end

  def dbt_edit
    @debt_upd = DebtRecorder.find(debt_upd_params[:id])
    redirect_to '/debt_recorder' if @debt_upd.update(debt_upd_params)
  end

  private

  def get_user_id
    session[:user]['id']
  end

  def income_params
    params.require(:income).permit(:description, :amount, :users_id)
  end

  def i_update_params
    params.require(:income).permit(:id, :description, :amount)
  end

  def debt_params
    params.require(:debt_recorders).permit(:date, :owed_to, :amount, :description, :users_id)
  end

  def expense_params
    params.require(:expense).permit(:category, :description, :amount, :users_id)
  end

  def e_update_params
    params.require(:expense).permit(:id, :category, :description, :amount)
  end

  def debt_upd_params
    params.require(:debt_recorders).permit(:id, :date, :owed_to, :amount, :description)
  end
end
