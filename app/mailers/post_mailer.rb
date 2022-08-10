class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.post_created.subject
  #
  def post_created
    @user = params[:user]
    @post = params[:post]
    @greeting = "Hi"

    # mail to: users.first.email
     mail to: "users@example.org"
  end
end
