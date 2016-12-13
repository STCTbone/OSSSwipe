defmodule OssSwipe.Repo.Migrations.CreateIssue do
  use Ecto.Migration

  def change do
    create table(:issues) do
      add :title, :string
      add :body, :text
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end
    create index(:issues, [:project_id])

  end
end
