class UserMailer < ApplicationMailer
  default from: 'plarry353@gmail.com'
  def schedule_train
    @user = params[:user]
    mail(to: @user.email, subject: 'Bienvenido a B52 Days')
  end
end
