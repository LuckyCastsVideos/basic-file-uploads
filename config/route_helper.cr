# This is used when generating URLs for your application
Lucky::RouteHelper.configure do |settings|
  if LuckyEnv.production?
    # Example: https://shrine_file_uploads.com
    settings.base_uri = ENV.fetch("APP_DOMAIN")
  else
    # Set domain to the default host/port in development/test
    settings.base_uri = "http://localhost:#{Lucky::ServerSettings.port}"
  end
end
