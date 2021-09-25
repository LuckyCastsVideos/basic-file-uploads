class AddImageToUsers::V20210925155151 < Avram::Migrator::Migration::V1
  def migrate
    alter table_for(User) do
      add profile_image_path : String?
    end
  end

  def rollback
    alter table_for(User) do
      remove :profile_image_path
    end
  end
end
