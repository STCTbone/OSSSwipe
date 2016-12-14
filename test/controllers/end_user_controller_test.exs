defmodule OssSwipe.UserControllerTest do
  use OssSwipe.ConnCase

  alias OssSwipe.EndUser
  @valid_attrs %{blacklist: [], email: "some content", favorites: [], first_name: "some content", github_name: "some content", last_name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, end_user_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing end users"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, end_user_path(conn, :new)
    assert html_response(conn, 200) =~ "New end user"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, end_user_path(conn, :create), end_user: @valid_attrs
    assert redirected_to(conn) == end_user_path(conn, :index)
    assert Repo.get_by(EndUser, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, end_user_path(conn, :create), end_user: @invalid_attrs
    assert html_response(conn, 200) =~ "New end user"
  end

  test "shows chosen resource", %{conn: conn} do
    end_user = Repo.insert! %EndUser{}
    conn = get conn, end_user_path(conn, :show, end_user)
    assert html_response(conn, 200) =~ "Show end user"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, end_user_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    end_user = Repo.insert! %EndUser{}
    conn = get conn, end_user_path(conn, :edit, end_user)
    assert html_response(conn, 200) =~ "Edit end user"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    end_user = Repo.insert! %EndUser{}
    conn = put conn, end_user_path(conn, :update, end_user), end_user: @valid_attrs
    assert redirected_to(conn) == end_user_path(conn, :show, end_user)
    assert Repo.get_by(EndUser, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    end_user = Repo.insert! %EndUser{}
    conn = put conn, end_user_path(conn, :update, end_user), end_user: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit end user"
  end

  test "deletes chosen resource", %{conn: conn} do
    end_user = Repo.insert! %EndUser{}
    conn = delete conn, end_user_path(conn, :delete, end_user)
    assert redirected_to(conn) == end_user_path(conn, :index)
    refute Repo.get(EndUser, end_user.id)
  end
end
