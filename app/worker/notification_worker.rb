class NotificationWorker
  include Sidekiq::Worker

  def perform(user)
  end
end
