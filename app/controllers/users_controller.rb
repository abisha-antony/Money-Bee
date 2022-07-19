class UsersController < ApplicationController
    
    def register
      user = User.new(user_params) #User - model's class name
      if user.save
        redirect_to "/login"
      else
        redirect_to "/signup"
      end
    end

    private
    def user_params
       params.required(:user).permit(:name, :email, :password)
    end
end
