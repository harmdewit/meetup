if Rails.env.production?
  ActionMailer::Base.smtp_settings = {
  	:address => "smtp.gmail.com" ,
  	:port => 587,
  	:domain => "gmail.com" ,
  	:user_name => "meetup+harmdezwart" ,
  	:password => "brood1945" ,
  	:authentication => "plain" ,
  	:enable_starttls_auto => true
  }

  ActionMailer::Base.default_url_options[:host] = "localhost:3000"
else
  ActionMailer::Base.smtp_settings = {
  	:address => "smtp.gmail.com" ,
  	:port => 587,
  	:domain => "gmail.com" ,
  	:user_name => "laredportal" ,
  	:password => "dmecgroep5" ,
  	:authentication => "plain" ,
  	:enable_starttls_auto => true
  }

  ActionMailer::Base.default_url_options[:host] = "localhost:3000"
end