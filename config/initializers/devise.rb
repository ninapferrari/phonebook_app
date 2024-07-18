Devise.setup do |config|
  config.secret_key = ENV['DEVISE_SECRET_KEY'] || '92419b8182d6985fb7c5e17499c0136c8934656402a28114266960a37f6b81b658a5e89d17521d13d9ea33f834bab040dd7cd7a38eceb74291fef3cfd5747bb3'

  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 12
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other
end
