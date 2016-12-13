defmodule OssSwipe.IssueTest do
  use OssSwipe.ModelCase

  alias OssSwipe.Issue

  @valid_attrs %{body: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Issue.changeset(%Issue{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Issue.changeset(%Issue{}, @invalid_attrs)
    refute changeset.valid?
  end
end
