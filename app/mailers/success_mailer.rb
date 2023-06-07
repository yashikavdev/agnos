class SuccessMailer < ApplicationMailer
  def mailer(email)
    mail(
      to: email,
      subject: 'order update'
    )
  end
end
