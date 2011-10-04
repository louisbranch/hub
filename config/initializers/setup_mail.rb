ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "diablohub.com",
  :user_name            => ENV['GMAIL_USER'],
  :password             => ENV['GMAIL_PASSWORD'],
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "diablohub.com"

require 'development_mail_interceptor'

ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
