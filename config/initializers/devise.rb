
Devise.setup do |config|
  
  config.mailer_sender = 'books@site.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = false

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 4..72

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  config.secret_key = '4f73949bbc98138da6cf3cf8c805f71ee4d9a34ae9bafd27562f0ac30f6e8dd097805aa68118704f36f4997c5f23efa871d99dc7d0782171c3daa173532432d4'

end
