# frozen_string_literal: true

# app/mailers/success_mailer.rb
class SuccessMailer < ApplicationMailer
  def mailer(email)
    mail(
      to: email,
      subject: 'order update'
    )
  end
end
