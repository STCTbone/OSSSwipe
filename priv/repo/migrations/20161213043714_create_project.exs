defmodule OssSwipe.Repo.Migrations.CreateProject do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :url, :string
      add :stars, :integer

      timestamps()
    end

  end
end
