defmodule OssSwipe.Repo.Migrations.ConsolidateEndUserAndUser do
  use Ecto.Migration

  def change do
    drop table(:end_users)
    alter table(:users) do
      add :favorites, {:array, :integer}
      add :blacklist, {:array, :integer}
      add :github_name, :string
    end
  end
end
