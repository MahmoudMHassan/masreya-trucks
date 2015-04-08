OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '329475520583785', '0de5fdc1b3926cc8b803ea968dd5502d'
end