class HomeController < ApplicationController
    def render_home
        render "mb/home"
    end
    def render_cover
        render "mb/cover"
    end
    def render_login
        render "mb/login"
    end
    def render_signup
        render "mb/reg"
    end
    def render_income
        render "mb/income"
    end
    def render_expense
        render "mb/expense"
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
end