ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
 :address => 'smtp.sendgrid.net',
 :port => '587',
 :authentication => :plain,
 :user_name => 'app66430907@heroku.com',
 :password => 'sftzul3r7103',
 :domain => 'heroku.com', 
 :enable_starttls_auto => true
}
