# frozen_string_literal: true


Devise.setup do |config|

  # config.secret_key = 'd2ea9c9844f3db74db0e74abb3be77fcdb2cb64638e0b69a826eebc2be3a74c9cc95ecfbfe77496b556b4ef4d2f0927956ffb3534588f495f2bc703ddc82ac61'
  # config.parent_controller = 'DeviseController'
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  # config.mailer = 'Devise::Mailer'
  # config.parent_mailer = 'ActionMailer::Base'
  require 'devise/orm/active_record'
  # config.authentication_keys = [:email]
  # config.request_keys = []
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  # config.params_authenticatable = true
  # :database      = Support basic authentication with authentication key + password
  # config.http_authenticatable = false
  # config.http_authenticatable_on_xhr = true
  # config.http_authentication_realm = 'Application'
  # config.paranoid = true
  # passing skip: :sessions to `devise_for` in your config/routes.rb
  config.skip_session_storage = [:http_auth]
  # config.clean_up_csrf_token_on_authentication = true
  # config.reload_routes = true
  # ==> Configuration for :database_authenticatable
  config.stretches = Rails.env.test? ? 1 : 12
  # config.pepper = '4cb009d00517969c055b4c384d7e434302e1dfb2196292daeb44dca473b2c835cdd9f8fcc346b0b22a4140ddca82e6bfa40ba8251ac09ec654b90927ba7f5e86'
  # config.send_email_changed_notification = false
  # config.send_password_change_notification = false
  # ==> Configuration for :confirmable
  # config.allow_unconfirmed_access_for = 2.days
  # config.confirm_within = 3.days
  config.reconfirmable = true
  # config.confirmation_keys = [:email]
  # config.remember_for = 2.weeks
  config.expire_all_remember_me_on_sign_out = true
  # config.extend_remember_period = false
  # config.rememberable_options = {}
  # ==> Configuration for :validatable
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  # ==> Configuration for :timeoutable
  # config.timeout_in = 30.minutes
  # ==> Configuration for :lockable
  # config.lock_strategy = :failed_attempts
  # config.unlock_keys = [:email]
  # config.unlock_strategy = :both
  # config.maximum_attempts = 20
  # config.unlock_in = 1.hour
  # config.last_attempt_warning = true
  # config.reset_password_keys = [:email]
  config.reset_password_within = 6.hours
  # config.sign_in_after_reset_password = true
  # config.encryptor = :sha512
   config.scoped_views = true
  # config.default_scope = :user
  # config.sign_out_all_scopes = true
  # config.navigational_formats = ['*/*', :html, :turbo_stream]
  # The default HTTP method used to sign out a resource. Default is :delete.
  config.sign_out_via = :delete
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'
  # config.warden do |manager|
  #   manager.intercept_401 = false
  #   manager.default_strategies(scope: :user).unshift :some_external_strategy
  # end
  # config.router_name = :my_engine
  # config.omniauth_path_prefix = '/my_engine/users/auth'
  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other
  # config.sign_in_after_change_password = true
end
