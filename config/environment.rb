# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.smtp_settings = {
:address => 'smtp.gmail.com',
:domain => 'gmail.com',
:port => 587,
:user_name => "ramarao.study@gmail.com",
:authentication => false,
:enable_starttls_auto => true,
:openssl_verify_mode => 'none' 
}
