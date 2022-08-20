# frozen_string_literal: true

class SearchController < ApplicationController
  def search_expense
    $exp_keyword = params[:exp]
    render 'mb/expense_search'
  end

  def search_income
    $inc_keyword = params[:inc]
    render 'mb/income_search'
  end

  def search_debt
    $debt_keyword = params[:debt]
    render 'mb/debt_search'
  end
end
