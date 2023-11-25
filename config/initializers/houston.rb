Houston::Client.configure do |config|
  config.url = ENV.fetch("HOUSTON_API_URL", "http://localhost:3000")
end
