defmodule OssSwipe.ProjectTest do
  use OssSwipe.ModelCase

  alias OssSwipe.Project

  @valid_attrs %{stars: 42, url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Project.changeset(%Project{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Project.changeset(%Project{}, @invalid_attrs)
    refute changeset.valid?
  end
end
