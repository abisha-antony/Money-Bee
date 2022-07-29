class SessionController < ApplicationController
    def login_handler
        user = User.find_by(email: user_params["email"])
        if user && user.authenticate(user_params["password"])
            session[:user] = user
            redirect_to "/home"
        else
            flash[:error] ="Invalid email or password"
            redirect_to "/login"
        end
    end

    private
    def user_params
        params.required(:user).permit(:email, :password)
    end
end
