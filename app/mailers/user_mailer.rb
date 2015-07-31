class UserMailer < ActionMailer::Base
  default from: "no-reply@bpac.com"
  layout 'mailer'

  def invite(user_id)
    @user = User.find user_id
    @token = @user.confirmation_hash
    @subject = "Baltimore Public Art Commons Invite"
    mail to: @user.email, subject: @subject
  end
end
