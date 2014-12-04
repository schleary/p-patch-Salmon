Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_CLIENT'], ENV['TWITTER_SECRET']
end
