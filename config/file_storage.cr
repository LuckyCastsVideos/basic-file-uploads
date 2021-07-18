Shrine.configure do |config|
  config.storages["cache"] = Shrine::Storage::FileSystem.new("tmp", prefix: "shrine/cache")
  config.storages["store"] = Shrine::Storage::FileSystem.new("tmp", prefix: "shrine/uploads")
end

# Using a storage option like Amazon Web Services S3? Your settings could look more complex, like this:
#
# Shrine.configure do |settings|
#   if Lucky::Env.test?
#     settings.storages["cache"] = Shrine::Storage::FileSystem.new("uploads", prefix: "cache")
#     settings.storages["store"] = Shrine::Storage::FileSystem.new("uploads")
#   else
#     region = setting_from_env("SHRINE_S3_REGION")
#     key = setting_from_env("SHRINE_S3_ACCESS_KEY")
#     secret = setting_from_env("SHRINE_S3_SECRET_KEY")
#
#     client = Awscr::S3::Client.new(region, key, secret)
#
#     bucket_name = "file-uploads-#{Lucky::Env.name}"
#
#     settings.storages["cache"] = Shrine::Storage::S3.new(bucket: bucket_name, client: client, prefix: "cache")
#     settings.storages["store"] = Shrine::Storage::S3.new(bucket: bucket_name, client: client)
#   end
# end
#
# private def setting_from_env(key)
#   ENV[key]? || raise_missing_key_message(key)
# end
#
# private def raise_missing_key_message(key)
#   puts "Missing #{key}. Please set the #{key} ENV var.".colorize.red
#   exit(1)
# end
