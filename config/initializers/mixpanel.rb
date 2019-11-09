Weedtalks.configure do |config|
  config.mixpanel = {
    token: Rails.application.credentials[Rails.env.to_sym][:mixpanel][:token],
  }
end

Mengpaneel.configure do |config|
  config.token = Weedtalks.config.mixpanel[:token]
end
