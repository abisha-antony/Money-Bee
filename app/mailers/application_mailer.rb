# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name('moneybeeofficial@gmail.com', 'Moneybee official')
  layout 'mailer'
end
