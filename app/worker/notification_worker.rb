# frozen_string_literal: true

class NotificationWorker
  include Sidekiq::Worker

  def perform(id)
    user = User.find(id)
    SuccessMailer.mailer(user.email).deliver_now
  end
end
