Shrine.configure do |config|
  config.storages["cache"] = Shrine::Storage::FileSystem.new("tmp", prefix: "shrine/cache")
  config.storages["store"] = Shrine::Storage::FileSystem.new("tmp", prefix: "shrine/uploads")
end
