class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.post_created.subject
  #
  def debt_reminder
    email = params[:to_email]
    @name = params[:name]
    @parameters = params[:params]
    mail(to: email,subject: "bla bla bla")
    # mail to: users.first.email
  
  end
  def forgot_password
    email = params[:to_email]
    @name = params[:name]
    @otp = params[:otp]
    mail(to: email, subject: "OTP for Password Reset")

  end
end
