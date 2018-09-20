require 'sidekiq'

class UserWorker
  include Sidekiq::Worker

  def perform(id)
    user=User.find(id)
    UserMailer.with(user: user).schedule_train.deliver_now
  end
end
