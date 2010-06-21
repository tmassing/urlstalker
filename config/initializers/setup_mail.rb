 ActionMailer::Base.smtp_settings = {
   :address              => "smtp.gmail.com",
   :port                 => 587,
   :domain               => "urlstalkers@gmail.com",
   :user_name            => "urlstalkers@gmail.com",
   :password             => "foofoofoo",
   :authentication       => "plain",
   :enable_starttls_auto => true
 }
