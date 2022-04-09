Recaptcha.configure do |config|
    config.site_key  = Rails.application.credentials.google_web_key_racaptcha
    config.secret_key = Rails.application.credentials.google_secret_key_racaptcha
end