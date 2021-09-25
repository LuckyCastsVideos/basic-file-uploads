class SaveUserSettings < User::SaveOperation
  permit_columns first_name, last_name

  attribute readonly_email : String

  file_attribute :profile_image

  before_save do
    profile_image.value.try do |image|
      upload_profile_image(image)
    end
  end

  private def upload_profile_image(image)
    result = Shrine.upload(io: File.new(image.tempfile.path), storage: "store", metadata: {"filename" => image.filename})

    if (old_profile_image = profile_image_path.value)
      delete_old_profile_image(old_profile_image)
    end

    profile_image_path.value = result.id
  end

  private def delete_old_profile_image(image)
    old_file = Shrine::UploadedFile.new(id: image, storage_key: "store")

    if old_file.exists?
      old_file.delete
    end
  end
end
