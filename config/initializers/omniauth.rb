Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github-oauth2, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_SECRET']
end