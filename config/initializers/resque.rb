uri = URI.parse(ENV["REDISTOGO_URL"])
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)


HerokuResqueAutoscaler.configure do |config|
  config.heroku_api_key  = ENV["HEROKU_API_KEY"]
  config.heroku_app_name = ENV["HEROKU_APP_NAME"]
end
