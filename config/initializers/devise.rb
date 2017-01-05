Devise.setup do |config|
  
  config.mailer_sender = 'taku @ CC <beherzt.e0102@gmail.com>'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..128
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  require 'omniauth-google-oauth2'
  config.omniauth :google_oauth2, '307380740579-j5o09j4rd0tk7ia4cdti21kgptathgp9.apps.googleusercontent.com', 'IUKoplmg0ELU44cHv5RzgggN', {access_type: "offline", approval_prompt: ""}

  require 'omniauth-facebook'
  config.omniauth :facebook, '1840420809574728', 'a5b73e4f964399ad482d98aa4f59cda6', scope: 'email', info_fields: 'email,name'

end
