defmodule OssSwipe.Project do
  use OssSwipe.Web, :model

  schema "projects" do
    field :url, :string
    field :stars, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url, :stars])
    |> validate_required([:url, :stars])
  end
end
