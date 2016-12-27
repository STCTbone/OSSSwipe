defmodule OssSwipe.UserTest do
  use OssSwipe.ModelCase

  alias OssSwipe.User

  @valid_attrs %{blacklist: [], email: "some@example.com", favorites: [], name: "some content", github_name: "some content", password: "foobar"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
