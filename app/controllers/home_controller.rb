# frozen_string_literal: true

class HomeController < ApplicationController

  def render_home
    expense = Expense.where(users_id: session[:user]['id'])
    @data_category = []
    @data_data = []
    expense.each do |x|
      @data_category.push(x['category'])
      @data_data.push(x['amount'])
    end
    p '=============='
    p @data_category
    p @data_data
    p session[:user] 
    render 'mb/home'
  end

  def render_cover
    render 'mb/cover'
  end

  def render_login
    render 'mb/login'
  end

  def render_signup
    render 'mb/reg'
  end

  def render_income
    income = Income.where(users_id: session[:user]['id'])
    @data_category = []
    @data_data = []
    income.each do |x|
      @data_category.push(x['description'])
      @data_data.push(x['amount'])
    end
    p '=============='
    p @data_category
    p @data_data
    render 'mb/income'
  end

  def render_expense
    render 'mb/expense'
  end

  def render_inc_edit
    render 'mb/inc_edit'
  end

  def render_exp_edit
    render 'mb/exp_edit'
  end

  def render_debt
    render 'mb/debt_recorder'
  end

  def render_debt_edit
    render 'mb/debt_edit'
  end
end
