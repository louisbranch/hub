class UserMailer < ActionMailer::Base
  default from: "branco@diablohub.com"
  
  def comment_notification(user,build,commenter)
    @user = user
    @build = build
    @commenter = commenter
    mail(:to => "#{user.name} <#{user.email}>", subject => "New Comment on #{build.name}")
  end
  
end
