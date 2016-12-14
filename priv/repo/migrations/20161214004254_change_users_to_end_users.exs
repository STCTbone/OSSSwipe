defmodule OssSwipe.Repo.Migrations.ChangeUsersToEndUsers do
  use Ecto.Migration

  def change do
    rename table(:users), to: table(:end_users)
  end
end
