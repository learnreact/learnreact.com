Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], 
end

if Rails.env.production? OmniAuth.config.full_host = "https://learnreact.com"