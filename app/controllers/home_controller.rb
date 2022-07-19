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
end
